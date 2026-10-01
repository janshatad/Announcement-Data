LED WALL TTS SETUP
===================

Replace your current display.html with this file.

Open:
https://janshatad.github.io/Announcement-Data/display.html?v=24

Before starting:
- Choose the voice.
- Test the voice.
- Adjust rate/volume.
- Click START LED DISPLAY.

After Start:
- Fullscreen is requested.
- The setup panel disappears.
- No controls remain on the LED wall.
- Every new QR scan is announced automatically.

VOICE QUALITY
-------------
The page prioritizes voices exposed by the browser whose names contain Natural, Neural, or Online.
For the best chance of natural Microsoft voices, use Microsoft Edge. Microsoft's Edge Read Aloud provides natural-sounding online voices, and Microsoft documents Neural/Multilingual voices including en-PH-RosaNeural, en-US-JennyNeural, en-US-AriaNeural, en-US-EmmaNeural, en-US-BrianNeural and en-US-RogerNeural.

IMPORTANT
---------
A normal GitHub Pages HTML page cannot securely call Microsoft Azure Speech as a private cloud API because an Azure subscription key must not be exposed in browser JavaScript. This version therefore uses the browser's speech engine and prioritizes natural/neural voices when the browser exposes them.

If you want guaranteed Microsoft Neural audio on every browser, the next step is a small Supabase Edge Function that keeps the Azure key server-side and returns MP3 audio to the LED wall.
