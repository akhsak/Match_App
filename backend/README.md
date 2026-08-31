# Match App Backend

This directory contains the Django REST API for Match App. It provides account signup/login, JWT tokens, and authenticated match checks stored in MySQL.

## Requirements

- Python 3.10 or later
- MySQL 8+ running locally or reachable over the network
- pip and a virtual environment

## Backend dependencies

Install all packages with `pip install -r requirements.txt`.

| Package | Why it is used |
| --- | --- |
| `Django` | Web framework, migrations, admin, and ORM. |
| `djangorestframework` | REST API views, serializers, permissions, and responses. |
| `djangorestframework-simplejwt` | JWT login, access tokens, refresh tokens, and bearer authentication. |
| `django-cors-headers` | Allows the Flutter web client to call the local API during development. |
| `PyMySQL` | Python driver used to connect Django to MySQL. |
| `python-dotenv` | Loads secret key and database configuration from `.env`. |

## 1. Create the database

Log in to MySQL as an administrator and run the following. Choose a strong password instead of the example password.

```sql
CREATE DATABASE machine_task_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'django_user'@'localhost' IDENTIFIED BY 'replace-with-a-strong-password';
GRANT ALL PRIVILEGES ON machine_task_db.* TO 'django_user'@'localhost';
FLUSH PRIVILEGES;
```

If MySQL is hosted elsewhere, create/grant the user for the host Django will connect from.

## 2. Create and configure `.env`

Create `backend/.env`. It is intentionally ignored by Git. Do not commit it.

```dotenv
SECRET_KEY=replace-with-a-long-random-django-secret
DB_NAME=machine_task_db
DB_USER=django_user
DB_PASSWORD=replace-with-a-strong-password
DB_HOST=127.0.0.1
DB_PORT=3306
```

`SECRET_KEY` and all database settings are read by `config/settings.py`. The included development defaults use `machine_task_db`, `django_user`, `127.0.0.1`, and port `3306`; defining all values explicitly is recommended.

## 3. Install Python dependencies

From this directory:

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

On macOS/Linux, activate with `source venv/bin/activate`.

## 4. Prepare and run Django

```powershell
python manage.py migrate
python manage.py runserver 0.0.0.0:8000
```

The API is available at `http://127.0.0.1:8000/api/v1/auth/`. Use `0.0.0.0` so an Android emulator or a phone on your local network can reach the server.

Optional administrator account:

```powershell
python manage.py createsuperuser
```

Open `http://127.0.0.1:8000/admin/` to use the Django admin.

## API reference

Base path: `/api/v1/auth`

| Method | Endpoint | Authentication | Description |
| --- | --- | --- | --- |
| POST | `/signup` | No | Create an account and return JWT tokens. |
| POST | `/login` | No | Sign in and return JWT tokens. |
| POST | `/token/refresh` | No | Exchange a refresh token for a new access token. |
| GET | `/me` | Bearer token | Get the current user. |
| GET | `/matches` | Bearer token | List the current user's saved matches. |
| POST | `/matches` | Bearer token | Create a match record directly. |
| POST | `/check-match` | Bearer token | Check two names and save the result. |

### Example: sign up

```http
POST /api/v1/auth/signup
Content-Type: application/json

{
  "email": "person@example.com",
  "password": "password-at-least-8-characters",
  "full_name": "Example Person"
}
```

The response contains `user`, `access_token`, and `refresh_token`.

### Example: check a match

```http
POST /api/v1/auth/check-match
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "boy_name": "Bachan",
  "girl_name": "Aash"
}
```

Names accept letters and spaces only. The current service always returns a positive result for `Bachan` and `Aash` (case-insensitive); other name pairs receive a random result. Each check is saved for the signed-in user.

## Project layout

```text
backend/
├── accounts/             # User and Match models, serializers, API views, match logic
├── config/               # Django settings and root URLs
├── manage.py             # Django command runner
└── requirements.txt      # Python dependencies
```

## Development notes

- JWT access tokens last 1 day; refresh tokens last 7 days.
- CORS currently permits all origins for local development. Restrict this before production.
- `DEBUG=True` and `ALLOWED_HOSTS=['*']` are development settings. Replace them and keep the secret key private before deployment.

## Troubleshooting

- **MySQL connection error:** verify that MySQL is running and that the values in `.env` match the database/user you created.
- **`Access denied` from MySQL:** check the MySQL username, password, and allowed host.
- **Migration error:** activate the virtual environment, confirm dependencies are installed, then run `python manage.py migrate` again.
- **Phone/emulator cannot reach the API:** start Django with `0.0.0.0:8000` and update the Flutter base URL as described in the Flutter README.
