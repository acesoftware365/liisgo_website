# Codex Memory 06162026

Project: Liisgo LLC Website
Local path: `/Users/juanpolanco/Desktop/Work/App in work/liisgo_website_09142025`
GitHub remote: `https://github.com/acesoftware365/liisgo_website.git`
Date: 2026-06-16

## Standing Rule

- Every time the website changes, increase the website version in `pubspec.yaml` before committing and pushing.
- Current website version after this update: `1.0.0+7`.
- Deployment uses the generated `build/web` folder. Make sure `app-ads.txt` is inside that web folder before uploading/publishing.

## What Changed

- Updated the home page hero to feel more like a Liisgo LLC brand landing page.
- Changed the hero copy in English and Spanish:
  - English: "Practical apps for everyday work."
  - Spanish: "Apps practicas para el dia a dia."
- Added two hero actions:
  - "View apps" / "Ver apps" scrolls to the app list.
  - "Contact" / "Contactar" opens an email to `sales@liisgo.com`.
- Added small hero stats:
  - `4` published apps.
  - `iOS + Android` mobile-first.
- Updated the sticky header on the home page:
  - Shows the Liisgo logo and name.
  - Adds a "Our Apps" / "Nuestras apps" quick link on wider screens.
  - Keeps the Settings link.
- Added a scroll anchor for the app section.
- Updated the download strip copy so it tells users to choose an app first instead of implying one generic download.
- Made the home download badges route to the Kapi Note app page rather than sitting as inactive images.
- Updated app detail store badges so a missing store URL appears disabled instead of opening the wrong app.
- Corrected the Alpha Discovery App Store URL:
  - `https://apps.apple.com/us/app/alpha-discovery/id6777330910`
- Removed the incorrect EzInvoice App Store placeholder that pointed to Kapi Note.
  - `ezInvoiceAppleAppStore` is now an empty string until the real App Store URL is available.

## Files Changed

- `lib/home_page.dart`
  - Home header, hero actions, hero stats, apps scroll anchor, download badge behavior.
- `lib/support_class/app_text.dart`
  - New bilingual copy and labels for hero actions, app section, and stats.
- `lib/pages/class_folder/app_page.dart`
  - Replaced direct badge launch widgets with `_StoreBadge`, which disables missing URLs.
- `lib/support_class/asset_links.dart`
  - Fixed Alpha Discovery App Store link.
  - Cleared bad EzInvoice App Store placeholder.

## Verification Done

- Ran `dart format` on changed Dart files.
- Ran `flutter analyze`.
  - Result: no compile errors.
  - Existing informational warnings remain, mostly Flutter `withOpacity` deprecation warnings in several files and a few existing URL launcher service lints.
- Ran `flutter build web`.
  - Result: successful build in `build/web`.
- Opened the site locally at `http://127.0.0.1:5387/`.
- Checked desktop viewport.
  - Header, hero, buttons, stats, and first part of app section looked correct.
- Checked mobile viewport at 390 x 844.
  - Header, hero text, buttons, stats, logo, and app heading stacked correctly with no visible overlap.

## Notes For Next Time

- EzInvoice still needs its real App Store URL when published or found. As of 2026-06-16, Apple developer search for Liisgo LLC lists Kapi Note, ShowMyName Display, and Alpha Discovery, but not EzInvoice.
- `build/web` was generated successfully but is not necessarily tracked by Git, depending on `.gitignore`.
- The repository already has many existing informational lint warnings. They were not part of this change.
- A generated hero image was briefly created during early exploration before the real project path was provided. It was not used in the Flutter project.
- The user wants changes pushed to GitHub repo `acesoftware365/liisgo_website`.
- The user said this GitHub repo is where the website is uploaded, and the website version must be increased every time changes are made.
- The user uploads/publishes the website from the `build/web` folder, with `app-ads.txt` included inside it.
- 2026-06-16 update:
  - Updated Kapi Note website info using the Kapi Note project copy.
  - Updated EzInvoice website info using the EzInvoice project facts: invoices, PDFs, customers, reports, business profile, invoice styles, Pro features, subscriptions, and ad-free plan behavior.
  - Added EzInvoice App Store link: `https://apps.apple.com/app/id6757661737`.
  - Added Terms and Conditions routes/pages for Kapi Note and EzInvoice:
    - `/apps/KapiNote/terms`
    - `/apps/EzInvoice/terms`
  - Added Terms and Conditions footer links on Kapi Note and EzInvoice app pages.
  - Verified `flutter build web` succeeds and `build/web/app-ads.txt` remains present.
- 2026-06-16 follow-up:
  - Removed the small Liisgo icon from the home page header, leaving only the Liisgo text.
  - Privacy and Terms pages now show a top-left app button with the current app icon and app name.
  - That app button navigates back to the app page being read, for example EzInvoice Terms -> EzInvoice app page.
  - Verified visually on local build: EzInvoice Terms header and home header.
