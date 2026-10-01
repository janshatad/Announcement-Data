-- Enable participant deletion for the current public/anon prototype admin page.
-- Run this once in Supabase SQL Editor.

drop policy if exists "public delete participants" on public.participants;

create policy "public delete participants"
on public.participants
for delete
to anon, authenticated
using (true);
