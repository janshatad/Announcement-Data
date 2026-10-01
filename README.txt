QR EVENT SYSTEM — ELEVENLABS LED TTS

1. Supabase Edge Function
Use the included eleven-tts/index.ts in your existing Supabase function named eleven-tts.
Deploy it from the Supabase Dashboard.

2. Supabase Secret
You already added:
ELEVENLABS_API_KEY

Do not put the ElevenLabs key in display.html or GitHub.

3. GitHub Pages
Replace your existing display.html with the included display.html.
Repository:
https://github.com/janshatad/Announcement-Data

GitHub Pages URL:
https://janshatad.github.io/Announcement-Data/

4. How it works
QR scan -> scan_history -> participant lookup -> LED display -> Supabase Edge Function -> ElevenLabs audio -> LED wall speaker.

5. Voice list
The Edge Function supports GET and POST. GET securely fetches the available ElevenLabs voices without exposing the API key to the browser.

6. Important
Rotate any ElevenLabs API key that has been exposed in chat or source code. Store the replacement only in Supabase Edge Function Secrets.
