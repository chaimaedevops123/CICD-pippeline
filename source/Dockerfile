# Utiliser une image de base Ubuntu
FROM ubuntu:latest

# Mettre à jour le gestionnaire de paquets et installer les outils nécessaires
RUN apt-get update && \
    apt-get install -y build-essential cmake libcunit1 libcunit1-doc libcunit1-dev
# Définir le répertoire de travail
WORKDIR /app
# Copier les fichiers sources et de test dans le conteneur
ADD SWC.c /app/SWC.c
ADD SWC.h /app/SWC.h
ADD testProtocole.c /app/testProtocole.c
ADD testProtocole.h /app/testProtocole.h



# Construire le projet
RUN gcc -o testProtocole SWC.c testProtocole.c -lcunit

# Définir le point d'entrée pour exécuter les tests
CMD ["./testProtocole"]