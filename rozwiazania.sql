-- Baza rozwiązań: tabela i RLS
-- Wklej w Supabase: SQL Editor -> New query -> Run
-- Dla nowej instalacji. Jeśli tabela rozwiazania już działa, nie uruchamiaj.

create table if not exists public.rozwiazania (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  tytul text not null check (char_length(tytul) between 1 and 200),
  zakres text not null default 'ogolne' check (zakres in ('ogolne', 'maszyna', 'grupa')),
  cel text not null default '',
  problem text not null default '',
  kroki text not null default '',
  tagi text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists rozwiazania_user_idx on public.rozwiazania (user_id, created_at desc);

alter table public.rozwiazania enable row level security;

drop policy if exists "own rozwiazania" on public.rozwiazania;
create policy "own rozwiazania" on public.rozwiazania
  for all using (user_id = auth.uid()) with check (user_id = auth.uid());
