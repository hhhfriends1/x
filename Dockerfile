FROM teddysun/v2ray:latest

# Expose the correct container port (8080)
EXPOSE 8080

# Optimize system settings
RUN echo 'net.core.rmem_max = 67108864' >> /etc/sysctl.conf && \
    echo 'net.core.wmem_max = 67108864' >> /etc/sysctl.conf && \
    echo 'net.ipv4.tcp_rmem = 4096 87380 67108864' >> /etc/sysctl.conf && \
    echo 'net.ipv4.tcp_wmem = 4096 65536 67108864' >> /etc/sysctl.conf
    
# Copy the VLESS config into the container
COPY config.json /etc/v2ray/config.json

# Run V2Ray with the config file
CMD ["v2ray", "run", "-config", "/etc/v2ray/config.json"]


