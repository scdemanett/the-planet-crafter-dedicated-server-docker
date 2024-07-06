FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y libmono-cil-dev && \
    rm -rf /var/lib/apt/lists/*

# Add a non-root user
RUN useradd -ms /bin/bash planetcrafter
USER planetcrafter

# Set working directory
WORKDIR /home/planetcrafter/PlanetCrafter

# Command to run the game in headless mode
CMD ["./Planet Crafter.exe", "-batchmode", "-nographics"]
