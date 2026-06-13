FROM fedora:44
RUN dnf upgrade && dnf -y install bind bind-utils tcpdump wireshark-cli
COPY docker-entrypoint.sh /usr/local/bin
EXPOSE 53/tcp
EXPOSE 53/udp
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["named", "-g", "-c", "/etc/named.conf", "-4", "-u", "named"]
