#set script
#!/bin/bash

#install dependencies
apt update -y && apt-get install git build-essential libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev libgd-dev libxml2 libxml2-dev uuid-dev make

#downlad nginx using wget
wget http://nginx.org/download/nginx-1.24.0.tar.gz #you can replace your desired version

#unzip the downloaded nginx
tar -zxvf nginx-1.24.0.tar.gz

# cd to the directory
cd nginx-1.24.0

# set your configuratiom
./configure \
    --prefix=/etc/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/run/nginx.pid \
    --sbin-path=/usr/sbin/nginx \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-http_stub_status_module \
    --with-http_realip_module \
    --with-file-aio \
    --with-threads \
    --with-stream \
    --with-stream_ssl_preread_module

#install make
make && make install


# confirm nginx is installed by checking the version
nginx -V