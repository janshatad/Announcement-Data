# QR Event Information System v2

## Features

- Supabase PostgreSQL participant database
- Participant photo upload/storage
- QR ID generator
- QR download and print
- QR camera scanner
- Automatic participant lookup
- Scan history
- Separate LED wall display page
- Browser Text-to-Speech
- GitHub Pages compatible

## 1. Create the database

Open Supabase SQL Editor and run `database.sql` in its entirety.

The script creates:

- `participants`
- `scan_history`
- `participant-photos` Storage bucket
- required Row Level Security policies

## 2. Configuration

`config.js` contains the Supabase project URL and browser publishable key.

The key supplied for this project is a publishable key. Never replace it with a `service_role` or `sb_secret_` key.

## 3. GitHub Pages

Upload all files to the root of your existing `Announcement-Data` repository:

- index.html
- admin.html
- scanner.html
- display.html
- config.js
- style.css
- database.sql
- README.md

GitHub Pages should use:

Branch: `main`
Folder: `/(root)`

## 4. URLs

After GitHub Pages publishes:

- Home: `/`
- Admin: `/admin.html`
- Scanner: `/scanner.html`
- LED Wall: `/display.html`

Example:

https://YOUR-USERNAME.github.io/Announcement-Data/admin.html

## 5. Test

1. Open Admin.
2. Create a participant with QR ID `SM-2026-0001`.
3. Select a participant photo.
4. Save.
5. Download/print the generated QR.
6. Open Scanner on a phone and allow camera permission.
7. Scan the QR.
8. Open Display on the computer connected to the LED wall.
9. The display polls the latest scan and updates automatically.
10. TTS runs on the scanner device in this version.

## Important security note

This is configured as an event prototype without login so it is easy to deploy. Anyone who knows the public site can potentially read/modify participant records because the SQL policies permit anonymous access.

Before using real sensitive participant information in production, add Supabase Authentication and restrict insert/update operations to authenticated admins. Do not expose secret/service-role keys in frontend code.

## TTS and LED wall

The current architecture is:

Phone/laptop scanner -> Supabase -> LED display.

The scanner speaks the result. If you want the LED-wall computer itself to speak, we can add a display-side TTS event/queue in the next version.


## v3 upload fix
The Admin page now:
- checks the Supabase database connection before saving;
- uploads photos directly to the `participant-photos` Storage endpoint;
- reports the HTTP status or network/CORS error instead of only showing `Failed to fetch`;
- keeps the same QR, scanner, display, and TTS workflow.

The Supabase URL and publishable key in `config.js` are the confirmed values for the current project.


## v4 database save fix
The Admin page now uses a direct Supabase REST request for participant saving, with a 15-second timeout and detailed HTTP/RLS error reporting. It does not wait for `.select().single()` after upsert, which prevents the Admin page from getting stuck on "Saving..." when the write succeeds but the response/query hangs.


## v5 form/save fix
The Save button is now explicitly a non-submit button with a click handler. This prevents accidental Android/browser form navigation or reload. The form is never cleared after saving. The success message is displayed before QR generation, so QR rendering cannot hide a successful database save.
