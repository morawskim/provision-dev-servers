#!/usr/bin/env ruby

require 'json'

def listDatabasesInContainer(containerId, root_password)
    `docker exec -e MYSQL_PWD=#{root_password} #{containerId} /usr/bin/mysql -uroot -s  -e 'SHOW DATABASES WHERE \`Database\` NOT REGEXP "(^mysql|_schema$)"' | tail -n +1`.split
end

def dump_database(containerId, root_password, db_name, file_name)
    `docker exec -e MYSQL_PWD=#{root_password} #{containerId} /usr/bin/mysqldump --single-transaction --quick --skip-lock-tables --routines --databases #{db_name} -uroot | gzip > #{file_name}.sql.gz`
end

if ARGV.length < 1
  puts "Dump to argument is required"
  exit 1
end
dump_dir = ARGV[0]

containers = `docker ps -q -f name=mysql`.split
containers.each do |containerId|
    sleep 2
    puts "#{containerId} looks like mysql container"
    containerId =  containerId.strip    
    inspect = `docker inspect #{containerId}`
    json = JSON.parse(inspect)
    time = Time.now
    env = json[0]['Config']['Env']
    service_name = (json[0]['Config']['Labels']['com.docker.swarm.service.name'] || json[0]['Name']).gsub(/[^\w]/, '')

    mysql = env.select { |v| v.start_with? 'MYSQL_ROOT_PASSWORD=' }
    if mysql.length == 1
        puts "#{containerId} has MYSQL_ROOT_PASSWORD env"
        length = mysql[0].length
        root_password = mysql[0][20..length]
        databases = listDatabasesInContainer(containerId, root_password)

        databases.each do |db_name|
            puts "#{containerId} dump db #{db_name}"
            file_name = "#{dump_dir}/#{db_name}-#{time.strftime("%Y-%m-%d_%H_%M_%S")}-#{service_name}"
            dump_database(containerId, root_password, db_name, file_name)
        end
    end

    mysql = env.select { |v| v.start_with? 'MYSQL_ROOT_PASSWORD_FILE=' }
    if mysql.length == 1
        puts "#{containerId} has MYSQL_ROOT_PASSWORD_FILE"
        length = mysql[0].length
        root_password_file = mysql[0][25..length]
        root_password = `docker exec #{containerId} cat #{root_password_file}`
        databases = listDatabasesInContainer(containerId, root_password)

        databases.each do |db_name|
            puts "#{containerId} dump db #{db_name}"
            file_name = "#{dump_dir}/#{db_name}-#{time.strftime("%Y-%m-%d_%H_%M_%S")}-#{service_name}"
            dump_database(containerId, root_password, db_name, file_name)
        end
    end
end
