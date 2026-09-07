# QR LED Wall — Fixed Version

## Why it did not work on the phone

If Chrome shows a URL beginning with `content://`, the HTML was opened as a local file/content document. Browser camera APIs generally require a **secure origin**.

Use one of these:

- `https://your-domain.com`
- `http://localhost:8080` on a computer

Do NOT open `index.html` directly from Android Files/Downloads.

## Quick test on a computer

1. Extract this folder.
2. Open a terminal in the folder.
3. Run:

```bash
python -m http.server 8080
```

4. On the same computer open:

```text
http://localhost:8080
```

5. Press START CAMERA and allow camera permission.

## Phone testing

For Android Chrome, deploy the folder to an HTTPS host such as GitHub Pages, Netlify, or Vercel. Then open the HTTPS address on the phone and allow camera access.

## QR format

JSON is recommended:

```json
{
  "id": "SM-2026-001",
  "name": "Juan Dela Cruz",
  "position": "Guest",
  "organization": "ABC Corporation",
  "message": "Welcome to the event!"
}
```

The scanner also accepts simple lines:

```text
ID: SM-2026-001
Name: Juan Dela Cruz
Position: Guest
Organization: ABC Corporation
Message: Welcome to the event!
```

## Important architecture note

For an actual LED-wall event, the next version should use two pages:

- `/scanner` — phone/laptop with camera
- `/display` — computer connected to the LED wall

A small server/WebSocket connection will send each scan from the scanner to the LED-wall computer instantly. This also allows the TTS to play from the LED-wall computer's speakers.
