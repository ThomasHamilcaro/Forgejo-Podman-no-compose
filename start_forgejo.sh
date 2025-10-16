#!/bin/bash

## Ce script démarre un conteneur Forgejo avec Podman.
## S'il vous plait, privilégiez l'utilisation de podman-compose pour une gestion plus facile des conteneurs si vous en avez la possibilité.
## docker-compose.yml permet une automatisation des paramètres run plus bas dès le fichier de configuration.

# Forgejo version to use
version=12.0.4 #EOL à date du 16/10/2025, date de la MAJ, en attente du nouvelle MAJ

# Run the Forgejo container with Podman (ensure Podman is installed and configured)
sudo podman run -d \ #sudo car on ne prend pas la version rootless
    -v /forgejo/data:/data \ #Pour avoir les repertoires et la configuration de persistent
    --restart=always \
    -p 80:3000 \ # :warning: Aucun serveur web ne doit être installé ou lancé
    -p 222:222 \ # :warning: Nécessite que le port ssh d'écoute de Forgejo soit modifié, sinon conflit de port lors de push
    --name Forgejo \ 
    --replace \
    codeberg.org/forgejo/forgejo:$version
