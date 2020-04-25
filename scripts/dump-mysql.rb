#!/usr/bin/env ruby

require 'json'

if ARGV.length < 1
  puts "Dump to argument is required"
  exit 1
end
dump_dir = ARGV[0]

containers = `docker ps -q -f name=mysql`.split
containers.each do |containerId|
    puts "#{containerId} looks like mysql container"
    containerId =  containerId.strip    
    inspect = `docker inspect #{containerId}`
    json = JSON.parse(inspect)
    
    env = json[0]['Config']['Env']
    mysql = env.select { |v| v.start_with? 'MYSQL_ROOT_PASSWORD=' }
    if mysql.length == 1
        puts "#{containerId} have MYSQL_ROOT_PASSWORD env"
        length = mysql[0].length
        root_password = mysql[0][20..length]
        time = Time.now
        databases = `docker exec -e MYSQL_PWD=#{root_password} #{containerId} /usr/bin/mysql -uroot -s  -e 'SHOW DATABASES WHERE \`Database\` NOT REGEXP "(^mysql|_schema$)"' | tail -n +1`.split
        databases.each do |db_name|
            puts "#{containerId} dump db #{db_name}"
            file_name = time.strftime("%Y-%m-%d_%H_%M_%S")
            output = `docker exec -e MYSQL_PWD=#{root_password} #{containerId} /usr/bin/mysqldump --single-transaction --skip-lock-tables --routines --databases #{db_name} -uroot | gzip > #{dump_dir}/#{db_name}-#{file_name}.sql.gz`
        end
    end
end
