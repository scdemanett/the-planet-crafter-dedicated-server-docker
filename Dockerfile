FROM ubuntu:latest

# Install necessary packages
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine64 wine32 libmono-cil-dev && \
    rm -rf /var/lib/apt/lists/*

# Add a non-root user
RUN useradd -ms /bin/bash planetcrafter
USER planetcrafter

# Set working directory
WORKDIR /home/planetcrafter/PlanetCrafter

# Command to run the game in headless mode using Wine
CMD ["wine", "Planet Crafter.exe", "-batchmode", "-nographics"]