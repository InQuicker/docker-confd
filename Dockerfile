FROM scratch

VOLUME /etc/confd
ADD confd /bin/confd

ENTRYPOINT ["/bin/confd"]
