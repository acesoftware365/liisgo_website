# Codex Memory 06162026

Project: Liisgo LLC Website
Local path: `/Users/juanpolanco/Desktop/Work/App in work/liisgo_website_09142025`
GitHub remote: `https://github.com/acesoftware365/liisgo_website.git`
Date: 2026-06-16

## Standing Rule

- Every time the website changes, increase the website version in `pubspec.yaml` before committing and pushing.
- Current website version after this update: `1.0.0+8`.
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
- 2026-06-16 visual app pages update:
  - Added `assets/app_pages/` to Flutter assets.
  - Added promotional images and screenshot-style app visuals for:
    - Kapi Note
    - EzInvoice
    - Alpha Discovery
    - ShowMyName
  - Added a reusable app visuals section to app detail pages between the hero and download area.
  - Verified visually on local build for EzInvoice and Alpha Discovery.
  - Website version increased to `1.0.0+8`.
- 2026-06-16 real app screenshots update:
  - Replaced the generated/generic app visuals with real screenshots or current app captures while keeping the same app page visual section style.
  - EzInvoice now uses current local screenshot sets from the device/simulator screenshot folders rather than older store screenshots.
  - Kapi Note now uses current local iPhone/iPad simulator screenshots from 2026-06-16.
  - Alpha Discovery was launched in the iPad simulator and new real screenshots were captured for Tracing, Vowels, and Counting views.
  - ShowMyName uses the updated App Store/Google Play screenshot resources because Juan confirmed those store screenshots are current.
  - Promotional image backgrounds and screenshot frames were recolored to match each app icon:
    - EzInvoice green.
    - Kapi Note red/pink.
    - Alpha Discovery blue/yellow.
    - ShowMyName dark purple/gold.
  - The reusable app visuals section now applies a subtle per-app accent tint and border based on the app icon color.
  - Website version increased to `1.0.0+9`.
- 2026-06-16 ShowMyName color correction:
  - Juan rejected the purple ShowMyName accent because it looked too loud.
  - Replaced the ShowMyName promo image, screenshot frames, button color, title color, and app page accent with a darker navy blue (`#123C63`).
  - Reduced the app-name text size in promotional images so the name does not look oversized or awkward.
  - Corrected the EzInvoice promotional image to use the real green EzInvoice app icon (`assets/miscellaneous/EzInvoice_Icon.png`) instead of the old blue finance icon.
  - Website version increased to `1.0.0+10`.
- 2026-06-16 Screenshot viewer update:
  - Added a popup viewer for app screenshots so visitors can click a screenshot, read it larger, and use zoom in / zoom out controls.
  - Kept the existing app page layout and visual styling unchanged outside the screenshot click behavior.
  - Website version increased to `1.0.0+11`.
- 2026-06-23 WakeNow shared alarm link update:
  - Added support for `/wakenow/shared-alarm/:payload` as a simple WakeNow landing page instead of a 404.
  - Direct non-hash URLs are handled in `web/index.html` with Android intent redirect to package `com.liisgo.wakenow` and a fallback page/button.
  - Added Netlify `_redirects` so `/wakenow/shared-alarm/*` serves `index.html`.
  - Added `web/.well-known/assetlinks.json` with WakeNow package name and an empty fingerprint list until Juan provides the SHA-256 certificate fingerprint.
  - Website version increased to `1.0.0+12`.
- 2026-06-23 WakeNow Android App Links fingerprint update:
  - Updated `web/.well-known/assetlinks.json` with the testing APK SHA-256 fingerprint: `D0:E9:F5:40:9B:A3:96:C2:64:9A:41:05:59:56:E4:91:57:E5:E9:EE:A5:E5:26:20:43:BF:DC:2E:DD:15:2A:09`.
  - Noted that Google Play App Signing may require adding another SHA-256 fingerprint later.
  - Website version increased to `1.0.0+13`.
- 2026-06-28 WakeNow app page preview update:
  - Added WakeNow as a new app on the Liisgo website home app grid.
  - Added WakeNow app, privacy, and terms routes:
    - `/apps/WakeNow`
    - `/apps/WakeNow/privacy`
    - `/apps/WakeNow/terms`
  - Copied the real WakeNow app icon from `/Users/juanpolanco/StudioProjects/wakenow/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png` into `assets/miscellaneous/wakenow_app_logo.png`.
  - Created WakeNow promotional and screenshot-style website assets using real WakeNow project alarm-card backgrounds and the real app icon:
    - `assets/app_pages/wakenow_promo.png`
    - `assets/app_pages/wakenow_screen_1.png`
    - `assets/app_pages/wakenow_screen_2.png`
    - `assets/app_pages/wakenow_screen_3.png`
  - Left WakeNow store links empty until Google Play or App Store links are available; badges display disabled instead of opening bad links.
  - Website version increased to `1.0.0+14`.
  - This change is for local preview first; do not upload/deploy until Juan approves the browser preview.
- 2026-06-28 WakeNow real assets replacement:
  - Juan generated real WakeNow website assets in `/Users/juanpolanco/StudioProjects/wakenow/website_assets/wakenow`.
  - Replaced the temporary WakeNow visuals with the real exported app assets:
    - `wakenow_icon.png`
    - `wakenow_promo.png`
    - `wakenow_screen_1.png`
    - `wakenow_screen_2.png`
    - `wakenow_screen_3.png`
    - `wakenow_share_alarm.png`
  - Updated the WakeNow page accent color to the app's main blue `#2447D8`.
  - Added the real share alarm screenshot to the WakeNow page visual gallery.
  - Added cache-busting website asset copies named `wakenow_real_*` because Chrome kept showing the earlier temporary promo from cache during local preview.
  - WakeNow recommended palette from the app project:
    - `#07111F`, `#17355B`, `#2447D8`, `#9FC2FF`, `#FFC83D`, `#FF8A2A`, `#13D3D3`, `#F8FAFC`.
- 2026-06-29 WakeNow new web photos update:
  - Juan provided updated WakeNow web images:
    - `/Users/juanpolanco/StudioProjects/wakenow/website_assets/wakenow/wakenow_promo.png`
    - `/Users/juanpolanco/StudioProjects/wakenow/website_assets/wakenow/wakenow_store.png`
  - Copied them into the Liisgo website as cache-busting final assets:
    - `assets/app_pages/wakenow_final_promo.png`
    - `assets/app_pages/wakenow_final_store.png`
  - Updated the WakeNow app page to use the new final promo image.
  - Added the WakeNow Store screenshot to the WakeNow screenshot gallery.
  - Removed the duplicate WakeNow home/share screenshot from the gallery after Juan noticed the repeated image; final gallery is Home, Store, Edit Alarm, and Wake Note.
  - Website version increased to `1.0.0+15`.
