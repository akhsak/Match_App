# Match App Flutter Client

The Flutter client for Match App. Users can sign up, log in, securely keep their JWT tokens, submit two names, and view a match result returned by the Django backend.

The API lives in [../backend](../backend/). Read [its setup guide](../backend/README.md) before running the app.

## Features

- Email/password signup and login
- Persistent JWT access and refresh tokens via `flutter_secure_storage`
- Authenticated match checks
- Match and no-match result screens
- Input validation for names
- Responsive Flutter UI for supported Flutter platforms

## Technology

| Area | Used in this project |
| --- | --- |
| UI | Flutter and Material Design |
| State management | Provider / ChangeNotifier |
| HTTP | Dio |
| Secure local storage | flutter_secure_storage |
| API | Django REST Framework with Simple JWT |

## Flutter dependencies

Packages are declared in `pubspec.yaml` and installed with `flutter pub get`.

| Package | Version | Why it is used |
| --- | --- | --- |
| `flutter` | SDK | Flutter UI framework. |
| `provider` | `^6.1.2` | `AuthProvider` and `MatchProvider` state management. |
| `dio` | `^5.7.0` | Sends JSON requests to the Django backend and adds bearer tokens. |
| `flutter_secure_storage` | `^11.0.0` | Securely saves access and refresh JWT tokens. |
| `google_fonts` | `^8.2.1` | App typography. |
| `shared_preferences` | `^2.5.5` | Local preferences support. |
| `cupertino_icons` | `^1.0.8` | Cupertino icon set. |

Development packages: `flutter_test` for tests and `flutter_lints` for static analysis.

## Requirements

- Flutter SDK compatible with Dart `^3.12.2`
- A device, emulator, simulator, or Chrome for Flutter
- The [Django backend](../backend/README.md) running and reachable from the selected device

Check your installation:

```powershell
flutter doctor
flutter --version
```

## Run the app step by step

### 1. Start the backend

Follow the [backend README](../backend/README.md) to create the MySQL database, configure `backend/.env`, run migrations, and start Django:

```powershell
cd ..\backend
.\venv\Scripts\Activate.ps1
python manage.py runserver 0.0.0.0:8000
```

Keep this terminal open while running Flutter.

### 2. Set the correct API address

Open [lib/core/constants/api_constants.dart](lib/core/constants/api_constants.dart). Set `baseUrl` for the device where the Flutter app runs:

| Target | Base URL value |
| --- | --- |
| Flutter web / Chrome on the same computer | `http://localhost:8000/api/v1/auth` |
| Android emulator | `http://10.0.2.2:8000/api/v1/auth` |
| Physical Android/iOS device | `http://YOUR_COMPUTER_LAN_IP:8000/api/v1/auth` |
| iOS simulator | `http://localhost:8000/api/v1/auth` |

For a physical device, replace `YOUR_COMPUTER_LAN_IP` with your computer's local IPv4 address, for example `192.168.1.20`. Ensure the phone and computer use the same Wi-Fi network and allow port `8000` through the firewall if prompted.

### 3. Install Flutter packages

In a new terminal:

```powershell
cd flutter_app
flutter pub get
```

### 4. Choose a target and run

List available targets:

```powershell
flutter devices
```

Run on the default target:

```powershell
flutter run
```

Or run in Chrome:

```powershell
flutter run -d chrome
```

## Use the application

1. Open the app. Users without a saved session are shown the login screen.
2. Select the signup option and create an account with an email address and a password of at least eight characters.
3. Log in. The app stores the returned access and refresh tokens in secure storage.
4. Enter the two names and select **Check Match**.
5. The client sends an authenticated request to the backend and shows the result screen.
6. Select **Check Another Match** to submit another pair.

For the current deterministic demo pair, use `Bachan` and `Aash`; the backend returns a match. Other valid name pairs return a random match/no-match result.

## API integration

The API base URL and paths are defined in `lib/core/constants/api_constants.dart`.

| Client action | API request |
| --- | --- |
| Sign up | `POST /signup` |
| Log in | `POST /login` |
| Refresh access token | `POST /token/refresh` |
| Check match | `POST /check-match` with `Authorization: Bearer <token>` |

The complete API contract, including request examples, is documented in [the backend README](../backend/README.md#api-reference).

## Navigation and data flow

### Screen navigation

```text
App starts
  ├─ saved valid token → Match Input
  └─ no/expired token → Login → Sign Up (optional) → Match Input → Match Result
                                                               └→ Check Another Match → Match Input
```

`AuthGate` in `lib/main.dart` checks for a saved token at startup. `RouteGenerator` in `lib/app/routes/route_generator.dart` provides these named routes:

| Route | Screen |
| --- | --- |
| `/` and `/login` | Login screen |
| `/signup` | Sign-up screen |
| `/match` and `/match-input` | Match input screen |
| `/result` and `/match-result` | Match result screen (requires a `MatchResult` route argument) |

The match input screen currently opens the result page with `MaterialPageRoute` after a successful check. This lets it display the value held by `MatchProvider`.

### Request flow to the backend

1. Login or signup UI calls `AuthProvider`.
2. `AuthProvider` uses `AuthApiService` and Dio to call `/login` or `/signup`.
3. Returned JWT access/refresh tokens are stored by `TokenStorage`.
4. The match form calls `MatchProvider`, which uses `MatchApiService` to post names to `/check-match`.
5. `ApiClient` reads the access token and sends `Authorization: Bearer <token>`.
6. Django validates the token, evaluates/saves the match in MySQL, and returns the result for the result screen.

## Project structure

```text
flutter_app/
├── lib/
│   ├── app/routes/                    # Named routes and route generator
│   ├── core/                          # API client, constants, storage, theme, shared widgets
│   └── features/
│       ├── auth/                      # Login/signup UI and authentication provider
│       └── match/                     # Match models, API services, provider, and result/input UI
├── android/                           # Android platform files
├── ios/                               # iOS platform files
├── web/                               # Web platform files
├── test/                              # Flutter tests
└── pubspec.yaml                       # Flutter packages and SDK constraint
```

## Important files

| File | Responsibility |
| --- | --- |
| `lib/main.dart` | Creates services/providers and selects login or match screen based on the saved session. |
| `lib/core/constants/api_constants.dart` | Backend API address and endpoint paths. |
| `lib/core/network/api_client.dart` | Dio setup, JSON headers, bearer token attachment, and API errors. |
| `lib/core/storage/token_storage.dart` | Saves, reads, and clears access/refresh tokens securely. |
| `lib/features/auth/presentation/controller/auth_providers.dart` | Login, signup, session restoration, and token refresh. |
| `lib/features/match/data/services/match_api_services.dart` | Calls the protected match-check endpoint. |
| `lib/features/match/presentation/pages/` | Match entry and result screens. |

## Quality checks

Run static analysis:

```powershell
flutter analyze
```

Run tests:

```powershell
flutter test
```

Create builds when your platform signing/configuration is ready:

```powershell
flutter build apk
flutter build web
```

## Troubleshooting

- **"Unable to connect to the server":** make sure Django is running, then verify `baseUrl` exactly matches the emulator, browser, or device you are using.
- **Android emulator cannot use `localhost`:** use `10.0.2.2`, not `localhost`.
- **Physical device cannot connect:** use the computer's LAN IP, run Django on `0.0.0.0:8000`, connect both devices to the same network, and check the firewall.
- **401/unauthorized error:** log in again to obtain fresh tokens. Confirm the backend uses the same endpoint paths and is running.
- **Dependency/build issue:** run `flutter clean`, then `flutter pub get` and `flutter run`.
- **Backend database issue:** consult the [backend troubleshooting section](../backend/README.md#troubleshooting).

## Development safety

Do not commit backend `.env` credentials. The current backend CORS, debug, and allowed-host settings are intended for development; tighten them before publishing the application.
