# Match App

A full-stack match-check application. The Flutter client lets a user create an account, sign in, submit two names, and view a match result. The Django REST API authenticates users with JWT and saves each check in MySQL.

## Project folders

| Folder | Purpose |
| --- | --- |
| [backend](backend/) | Django REST API, JWT authentication, MySQL models, and match logic. |
| [flutter_app](flutter_app/) | Flutter mobile/web client. |

## How the two sides connect

```text
Flutter screens → Provider → Dio API client → Django REST API → MySQL
```

Flutter uses the API base URL in `flutter_app/lib/core/constants/api_constants.dart`. Django exposes its authentication and match endpoints under `/api/v1/auth/`. See the [Flutter navigation and dependencies](flutter_app/README.md#navigation-and-data-flow) and [backend API/dependencies](backend/README.md#api-reference).

## Run the complete project

1. Start MySQL and create the database and database user described in the [backend guide](backend/README.md).
2. Configure `backend/.env`, install the Python packages, run migrations, and start Django:

   ```powershell
   cd backend
   .\venv\Scripts\Activate.ps1
   python manage.py migrate
   python manage.py runserver 0.0.0.0:8000
   ```

3. In a second terminal, configure the API URL in `flutter_app/lib/core/constants/api_constants.dart`, install Flutter packages, and run the app:

   ```powershell
   cd flutter_app
   flutter pub get
   flutter run
   ```

For full, step-by-step instructions, see [the Flutter README](flutter_app/README.md) and [the backend README](backend/README.md).
