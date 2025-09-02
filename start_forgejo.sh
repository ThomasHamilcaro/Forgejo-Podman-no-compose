#!/bin/bash

## Ce script démarre un conteneur Forgejo avec Podman.
## S'il vous plait, privilégiez l'utilisation de podman-compose pour une gestion plus facile des conteneurs si vous en avez la possibilité.
## podman-compose.yml permet une automatisation des paramètres run plus bas dès le fichier de configuration.

# Forgejo version to use
version=12.0.1

# Run the Forgejo container with Podman (ensure Podman is installed and configured)
podman run -d \
    -v ./forgejo:/data \
    --restart=always \
    -p 3000:3000 \
    -p 222:22 \
    --name Forgejo --replace \
    codeberg.org/forgejo/forgejo:$version
