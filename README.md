# The Planet Crafter Dedicated Server Docker (Container Runs But Won't Accept Connection From Clients)

## Special Thanks And Credit Where Credit Is Due

Special Thanks to Leandro_IT and their most helpful work and [post making this possible](https://www.reddit.com/r/theplanetcrafter/comments/1dkmzw6/running_the_planet_crafter_as_a_dedicated_server).

Without their work on the `Assembly-CSharp.dll`, [details of the modifications to this file here](https://medium.com/@leandrotlz/making-a-dedicated-server-for-the-planet-crafter-83a8c806e622), none of this would be possible.

## Introduction

This repository contains the necessary files and instructions to run The Planet Crafter as a dedicated server using Docker. This setup allows you to host a persistent game world that can be accessed by multiple players at different times.

## Prerequisites

- Docker
- [GOG version](https://www.gog.com/en/game/the_planet_crafter) of The Planet Crafter game files
- [Modified `Assembly-CSharp.dll`](https://www.dropbox.com/scl/fi/u1ipvkb1kfbd0o1bxd9cp/planet-crafter-105-dedicated-server.7z?rlkey=4y6txcwfj55qjjy3x0b0f5ao8&st=nuwig8kq&dl=0) for dedicated server functionality (Also included in the `files` directory of this repo)

## Setup Instructions

### 1. Prepare the Game Files

1. Install The Planet Crafter on your local machine using the GOG installer.
2. Replace `Assembly-CSharp.dll` in the game's `Managed` directory with the modified version from [this link](https://www.dropbox.com/scl/fi/u1ipvkb1kfbd0o1bxd9cp/planet-crafter-105-dedicated-server.7z?rlkey=4y6txcwfj55qjjy3x0b0f5ao8&st=nuwig8kq&dl=0) (Also included in the `files` directory of this repo).
3. Setup directories to map for `gamefiles` and `saves`. e.g. `/docker/the-planet-crafter/gamefiles` and `/docker/the-planet-crafter/saves`
4. Transfer the game files to your `gamefiles` directory e.g. `/docker/the-planet-crafter/gamefiles`.
5. Copy your saved world, found in Windws: `%USERPROFILE%/AppData/LocalLow/MijuGames/Planet Crafter` / MacOS: `~/Library/Application Support/MijuGames/Planet Crafter`, as `Server-1.json` to the `saves` directory.
6. Map network ports if necessary, the container is set to use port 7777 by default.
