QR Event System — Delete Fix

1. Run enable_participant_delete.sql in Supabase SQL Editor.
2. Replace your current admin.html with the included admin.html.
3. Refresh the Registration/Admin page.

The fixed Delete button:
- asks for confirmation;
- sends DELETE with return=representation;
- verifies that a row was actually deleted;
- shows an error if RLS prevents deletion;
- reloads the participant list after deletion.

This uses the same Supabase URL/publishable key already used by your existing admin page.
