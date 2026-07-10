create table if not exists public.contact_requests (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),

  name text not null,
  business_name text,
  email text,
  phone text,
  city text,
  need text not null,
  message text,

  status text not null default 'new'
);

alter table public.contact_requests enable row level security;

create policy "Allow public insert contact requests"
on public.contact_requests
for insert
to anon
with check (true);