create table if not exists public.system_settings (
  id bigint primary key,
  tts_enabled boolean not null default true,
  tts_voice text not null default '',
  tts_rate numeric not null default 1,
  tts_pitch numeric not null default 1,
  tts_volume numeric not null default 1,
  updated_at timestamptz not null default now()
);
insert into public.system_settings (id,tts_enabled,tts_voice,tts_rate,tts_pitch,tts_volume)
values (1,true,'',1,1,1) on conflict (id) do nothing;
alter table public.system_settings enable row level security;
drop policy if exists "public read system settings" on public.system_settings;
drop policy if exists "public update system settings" on public.system_settings;
create policy "public read system settings" on public.system_settings for select to anon,authenticated using (true);
create policy "public update system settings" on public.system_settings for update to anon,authenticated using (true) with check (true);
