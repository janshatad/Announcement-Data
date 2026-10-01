LED WALL FIX

Replace scanner.html and display.html in your GitHub Pages repository.

The important fix is that display.html no longer depends on Supabase's embedded participants relationship. It:
1. Reads the newest scan_history row.
2. Gets participant_id from that row.
3. Fetches the participant directly from participants.
4. Updates the LED wall.

scanner.html now also checks whether scan_history INSERT succeeds and shows the exact error.

Use cache-busting URLs after deployment:
scanner.html?v=22
display.html?v=22
