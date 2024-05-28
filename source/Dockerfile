# Utiliser une image de base Ubuntu
FROM ubuntu:latest

# Mettre à jour le gestionnaire de paquets et installer les outils nécessaires
RUN apt-get update && \
    apt-get install -y build-essential gcc libcunit1 libcunit1-dev make

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers sources et de test dans le conteneur
COPY . .

# Construire le projet
RUN make all

# Définir le point d'entrée pour exécuter les tests
CMD ["make", "test"]
