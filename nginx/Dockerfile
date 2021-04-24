# nginx
FROM nginx:alpine

# nginx conf & port dependencies
COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx
EXPOSE 80 2222

# ssh setup for Alpine
RUN apk add --update openssh-server tzdata openrc openssl \
        && echo "root:Docker!" | chpasswd \
        && rm -rf /var/cache/apk/* \
        # Remove unnecessary services
        && rm -f /etc/init.d/hwdrivers \
                 /etc/init.d/hwclock \
                 /etc/init.d/mtab \
                 /etc/init.d/bootmisc \
                 /etc/init.d/modules \
                 /etc/init.d/modules-load \
                 /etc/init.d/modloop \
        # Can't do cgroups
        && sed -i 's/\tcgroup_add_service/\t#cgroup_add_service/g' /lib/rc/sh/openrc-run.sh \
        && apk add --no-cache bash; 
COPY sshd_config /etc/ssh/

# startup script - ssh/nginx
COPY init.sh /tmp
RUN chmod 755 /tmp/init.sh

ENTRYPOINT ["/tmp/init.sh"]
