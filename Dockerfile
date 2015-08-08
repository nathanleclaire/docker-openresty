from debian:jessie

run apt-get update
run apt-get install -y \
        libreadline-dev \
        libncurses5-dev \
        libpcre3-dev \
        libssl-dev \
        perl \
        wget \
        make \
        build-essential
run mkdir -p /openresty
workdir /openresty
env OPENRESTY_VERSION 1.7.10.2
run wget http://openresty.org/download/ngx_openresty-${OPENRESTY_VERSION}.tar.gz
run tar xzvf ngx_openresty-${OPENRESTY_VERSION}.tar.gz
run cd ngx_openresty-${OPENRESTY_VERSION}/ && \
    ./configure && \
    make && \
    make install
env PATH /usr/local/openresty/nginx/sbin:$PATH
add https://get.docker.com/builds/Linux/x86_64/docker-latest /docker
run chmod +x /docker
add . /app
workdir /app
entrypoint ["./entrypoint.sh"]
