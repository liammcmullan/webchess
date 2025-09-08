# WebChess (legacy) – Dockerized

This repo packages a legacy PHP chess app (uses `mysql_*` API) with **PHP 5.6 + Apache** and **MariaDB 10.6**, suitable for Portainer “Deploy from Git”.

## Quick Start (Portainer)

1. **Put your app files** in `app/` (e.g., `install.php`, `index.php`, `config.php`, etc.).
2. (Optional) Copy `.env.example` to `.env` and adjust ports/DB credentials.
3. In **Portainer → Stacks → Add stack → Repository**:
   - Repository URL: `https://github.com/youruser/webchess.git`
   - Compose path: `docker-compose.yml`
   - Git reference: `main` (or your branch)
   - **Auto build** on changes (optional).
   - Supply env vars from `.env` or Portainer’s “Environment variables” form.
4. **Deploy the stack**.
5. Open `http://<host>:8080/install.php` to initialize the DB.

### Config.php settings (inside the app)
The DB host is the service name in Compose: `db`.

```php
$CFG_SERVER   = "db";
$CFG_DATABASE = getenv('MYSQL_DATABASE') ?: "webchess";
$CFG_USER     = getenv('MYSQL_USER')     ?: "webchess";
$CFG_PASSWORD = getenv('MYSQL_PASSWORD') ?: "ChangeMe123!";
