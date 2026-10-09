# Mohamed Nasr Eldeen — Flutter Web Portfolio

A responsive Flutter Web portfolio for Mohamed Nasr Eldeen, Flutter developer. It presents profile information, skills, selected mobile-app projects, interactive motion explorations, services, and contact links.

Verified with Flutter 3.22.0 (Dart 3.4.0) and Flutter 3.47.7.

## Run locally

Install the Flutter stable SDK, then from the repository root run:

```bash
flutter pub get
flutter run -d chrome
```

To create a production web build:

```bash
flutter build web --release
```

The deployable site is written to `build/web/`. Configure the host to serve that directory and use a root base path (or pass the appropriate `--base-href` for a subpath deployment).

## Vercel deployment

The repository includes `vercel.json` and `scripts/vercel-install-flutter.sh`. Vercel installs Flutter stable, resolves the project dependencies, runs a release web build, and serves `build/web/`.

## Project layout

- `lib/main.dart` — Flutter app and page sections.
- `web/` — Flutter Web entry page, manifest, and icons.
- `assets/` — Existing portrait and project imagery used by the app.
- `legacy_static/` — The original standalone HTML portfolio and export utility, kept as a reference during the migration.

## Portfolio content

The site keeps the existing profile and four selected projects: Matjarkom, TrustSafe, Brew & Bloom, and Build-Guard. Project cards open a responsive case-study gallery. The Motion Lab contains interactive UI-animation explorations; replace or extend these examples with your own animation clips/screens as you want to showcase them.

Contact links currently point to `mohamed.nasr.flutter@gmail.com`, WhatsApp, GitHub, and LinkedIn. Review the experience, skill-level, project-description, and contact details before publishing.
