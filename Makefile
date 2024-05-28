# Nom du programme principal
TARGET = swc_program

# Nom du programme de test
TEST_TARGET = test_program

# Compilateur
CC = gcc

# Options de compilation
CFLAGS = -Wall -Wextra -pedantic -std=c11

# Options de l'édition des liens
LDFLAGS = -lcunit

# Liste des fichiers source pour le programme principal
SRCS = SWC.c

# Liste des fichiers source pour le programme de test
TEST_SRCS = testProtocole.c

# Liste des fichiers objets pour le programme principal
OBJS = $(SRCS:.c=.o)

# Liste des fichiers objets pour le programme de test
TEST_OBJS = $(TEST_SRCS:.c=.o)

# Répertoire contenant les fichiers d'en-tête
INC_DIR = .

# Répertoire contenant les fichiers source
SRC_DIR = .

# Répertoire de sortie pour les fichiers objets
OBJ_DIR = obj

# Chemin vers les fichiers d'en-tête
INC_PATHS = -I$(INC_DIR)

# Commande pour créer le répertoire d'objets s'il n'existe pas
MKDIR_P = mkdir -p

# Commande pour supprimer des fichiers
RM = rm -f

# Option pour créer les dossiers dans le chemin de sortie
MKDIR = mkdir -p

# Règle par défaut
all: $(TARGET) $(TEST_TARGET)

# Compilation du programme principal
$(TARGET): $(OBJ_DIR) $(OBJS)
    $(CC) $(CFLAGS) $(INC_PATHS) $(OBJ_DIR)/*.o -o $@

# Compilation du programme de test
$(TEST_TARGET): $(OBJ_DIR) $(OBJS) $(TEST_OBJS)
    $(CC) $(CFLAGS) $(LDFLAGS) $(INC_PATHS) $(OBJ_DIR)/*.o $(TEST_OBJS) -o $@

# Création du répertoire d'objets
$(OBJ_DIR):
    $(MKDIR_P) $(OBJ_DIR)

# Règle pour compiler les fichiers source en fichiers objets
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
    $(CC) $(CFLAGS) $(INC_PATHS) -c $< -o $@

# Nettoyage des fichiers objets et des exécutables
clean:
    $(RM) $(OBJ_DIR)/*.o $(TARGET) $(TEST_TARGET)

# Lancer les tests
test: $(TEST_TARGET)
    ./$(TEST_TARGET)

# Indiquer que les cibles 'clean' et 'test' ne sont pas des fichiers
.PHONY: clean test
