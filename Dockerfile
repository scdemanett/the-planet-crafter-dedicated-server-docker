FROM ubuntu:20.04

# Install necessary packages and Wine
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y software-properties-common wget unzip && \
    apt-get install -y wine64 wine32 libwine libmono-cil-dev winetricks && \
    rm -rf /var/lib/apt/lists/*

# Add non-root user
RUN useradd -ms /bin/bash planetcrafter
USER planetcrafter

# Set working directory
WORKDIR /home/planetcrafter/PlanetCrafter

# Copy entrypoint script
COPY entrypoint.sh /home/planetcrafter/entrypoint.sh
RUN chmod +x /home/planetcrafter/entrypoint.sh

# Command to run the entrypoint script
CMD ["bash", "/home/planetcrafter/entrypoint.sh"]
