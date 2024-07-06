FROM ubuntu:20.04

# Install necessary packages
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y software-properties-common wget unzip && \
    apt-get install -y wine64 wine32 libwine libmono-cil-dev winetricks && \
    rm -rf /var/lib/apt/lists/*

# Install SteamCMD
RUN mkdir -p /home/planetcrafter/steamcmd && \
    cd /home/planetcrafter/steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm steamcmd_linux.tar.gz

# Add non-root user
RUN useradd -ms /bin/bash planetcrafter
USER planetcrafter

# Set working directory
WORKDIR /home/planetcrafter

# Copy entrypoint script
COPY entrypoint.sh /home/planetcrafter/entrypoint.sh

# Command to run the entrypoint script
CMD ["bash", "/home/planetcrafter/entrypoint.sh"]