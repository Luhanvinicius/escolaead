# Guia de Implantação em VPS Linux - Escola EAD

Este guia fornece um passo a passo para configurar e hospedar o sistema **Escola EAD** em um servidor VPS Linux (Ubuntu 22.04 LTS recomendado).

---

## 1. Requisitos do Sistema
- **SO:** Ubuntu 22.04 LTS ou superior.
- **Servidor Web:** Nginx (Recomendado) ou Apache.
- **PHP:** 8.1 ou superior (com extensões: `bcmath`, `ctype`, `fileinfo`, `json`, `mbstring`, `openssl`, `pdo`, `tokenizer`, `xml`, `curl`).
- **Banco de Dados:** MySQL 8.0+ ou MariaDB.
- **Ferramentas:** Composer, Git, Unzip.

---

## 2. Preparação do Servidor

Atualize os pacotes do sistema:
```bash
sudo apt update && sudo apt upgrade -y
```

### Instalar PHP e extensões:
```bash
sudo apt install php-fpm php-mysql php-common php-cli php-gd php-mbstring php-tokenizer php-xml php-curl php-zip -y
```

### Instalar MySQL:
```bash
sudo apt install mysql-server -y
sudo mysql_secure_installation
```

---

## 3. Instalação do Projeto

Navegue até o diretório web (exemplo no Nginx):
```bash
cd /var/www
```

Clone o repositório:
```bash
sudo git clone https://github.com/Luhanvinicius/escolaead.git
sudo chown -R $USER:$USER /var/www/escolaead
cd escolaead
```

### Instalar dependências do Composer:
```bash
composer install --no-dev --optimize-autoloader
```

---

## 4. Configuração do Ambiente (.env)

Crie o arquivo `.env` a partir do exemplo:
```bash
cp .env.example .env
nano .env
```

**Principais campos para editar:**
```dotenv
APP_NAME="Escola EAD"
APP_ENV=production
APP_DEBUG=false
APP_URL=https://seu-dominio.com

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=nome_do_banco
DB_USERNAME=usuario_do_banco
DB_PASSWORD=senha_do_banco

SESSION_DRIVER=file
QUEUE_CONNECTION=sync
```

Gere a chave da aplicação:
```bash
php artisan key:generate
```

---

## 5. Configuração do Banco de Dados

Crie o banco de dados via MySQL:
```sql
CREATE DATABASE escolaead CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'usuario_ead'@'localhost' IDENTIFIED BY 'sua_senha_segura';
GRANT ALL PRIVILEGES ON escolaead.* TO 'usuario_ead'@'localhost';
FLUSH PRIVILEGES;
```

Execute as migrações (e seeders se houver):
```bash
php artisan migrate --force
```

---

## 6. Permissões de Pasta

O servidor web (ex: `www-data`) precisa de acesso de escrita em pastas específicas:
```bash
sudo chown -R www-data:www-data /var/www/escolaead/storage
sudo chown -R www-data:www-data /var/www/escolaead/bootstrap/cache
sudo chmod -R 775 /var/www/escolaead/storage
sudo chmod -R 775 /var/www/escolaead/bootstrap/cache
```

Crie o link simbólico para o storage:
```bash
php artisan storage:link
```

---

## 7. Configuração do Servidor Web (Nginx)

Crie um arquivo de configuração para o site:
```bash
sudo nano /etc/nginx/sites-available/escolaead
```

Cole a configuração abaixo (ajuste o domínio e caminho):
```nginx
server {
    listen 80;
    server_name seu-dominio.com;
    root /var/www/escolaead/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    index index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock; # Ajuste para sua versão de PHP
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```

Ative o site e reinicie o Nginx:
```bash
sudo ln -s /etc/nginx/sites-available/escolaead /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

---

## 8. Segurança e SSL (SSL Gratuito)

Use o Certbot para instalar o SSL do Let's Encrypt:
```bash
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d seu-dominio.com
```

---

## 9. Dicas Adicionais

### Otimização para Produção:
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

### Limpeza de Cache (Caso necessário):
```bash
php artisan optimize:clear
```

---
**Escola EAD - Versão 1.0**
Guias adicionais podem ser encontrados na documentação oficial do Laravel.
