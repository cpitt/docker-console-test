FROM nginx:latest

RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip && \
    rm -rf /var/lib/apt/lists/*

RUN curl -Lo /tmp/consul_template_0.11.0_linux_amd64.zip https://github.com/hashicorp/consul-template/releases/download/v0.11.0/consul_template_0.11.0_linux_amd64.zip \
    && cd /tmp \
    && unzip /tmp/consul_template_0.11.0_linux_amd64.zip \
    && mv consul-template /bin \
    && rm -rf /tmp/*


RUN curl -Lo /tmp/containerbuddy.tar.gz https://github.com/joyent/containerbuddy/releases/download/0.1.3/containerbuddy-0.1.3.tar.gz \
    && cd /tmp  \
    && tar xzfv containerbuddy.tar.gz \
    && mv containerbuddy /bin/containerbuddy \
    && rm -rf /tmp/*

# add containerbuddy and all our configuration
ADD opt/containerbuddy /opt/containerbuddy/
ADD etc/nginx/conf.d /etc/nginx/conf.d/

CMD containerbuddy -config file:///opt/containerbuddy/nginx.json nginx -g "daemon off;"

