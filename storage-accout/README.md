# Documentation - Déploiement Azure avec Bicep et PowerShell

### Structure des Fichiers

Ce projet comprend trois modules Bicep pour le provisionnement des ressources dans Azure, ainsi qu’un script PowerShell pour exécuter ces modules.

### 1. Modules Bicep

#### 1.1 Module KeyVault (keyvault.bicep)

Ce module provisionne un KeyVault avec des paramètres basiques.

**Paramètres :**

- keyVaultName : Nom du KeyVault à créer.
- location : Région où le KeyVault sera créé (facultatif, par défaut égale à la région du groupe de ressources).

#### 1.2 Module Compte de Stockage (storageAccount.bicep)

Ce module provisionne un compte de stockage Azure avec les paramètres de base.

**Paramètres :**

- storageAccountName : Nom du compte de stockage à créer.
- location : Région où le compte de stockage sera créé (facultatif).

#### 1.3 Module Génération de Clé dans KeyVault (keyvaultKey.bicep)

Ce module génère une clé dans le KeyVault spécifié.

**Paramètres :**

- keyVaultName : Nom du KeyVault où la clé sera générée.
- keyName : Nom de la clé à générer.

### 2. Fichier Principal Bicep (main.bicep)

Ce fichier intègre les trois modules ci-dessus pour provisionner un KeyVault, un compte de stockage, et générer une clé dans le KeyVault.

### 3. Script PowerShell (main.ps1)

Ce script PowerShell exécute le fichier main.bicep en définissant les paramètres nécessaires. Il vérifie également si le groupe de ressources existe déjà et le crée si besoin.

### Prérequis

- Azure CLI ou Azure PowerShell doit être installé.
- Vous devez être authentifié à votre compte Azure avant d’exécuter le script PowerShell.
- Créez un groupe de ressources ou laissez le script le faire pour vous.

### Instructions d’Utilisation

1.	Téléchargez les fichiers Bicep et PowerShell : Assurez-vous que les fichiers keyvault.bicep, storageAccount.bicep, keyvaultKey.bicep, et main.bicep sont dans le même répertoire que le script main.ps1.
2.	Exécutez le script PowerShell : Ouvrez une session PowerShell et exécutez le script avec la commande suivante :

```console
foo@bar:~$./main.ps1
```

3.	Vérifiez le déploiement : Le script provisionnera le KeyVault, le compte de stockage et générera la clé dans le KeyVault. Vérifiez les ressources créées dans le groupe de ressources spécifié dans votre portail Azure.
