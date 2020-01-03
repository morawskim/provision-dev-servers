 #!/bin/bash

set -euo pipefail
IFS=$'\n\t'

domainName=${1?Pass a domain name as first argument}

sudo tee /etc/nginx/sites-available/${domainName} << EOF
server {
    server_name $domainName;

    location / {
        proxy_pass ${2?Pass destination address as second argument with scheme};
        proxy_set_header  Host \$http_host;
        proxy_set_header  X-Real-IP  \$remote_addr;
        proxy_set_header  X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header  X-Forwarded-Proto \$scheme;
    }
}
EOF

sudo ln -sf /etc/nginx/sites-available/$domainName /etc/nginx/sites-enabled/
sudo /usr/sbin/nginx -t
sudo service nginx reload
