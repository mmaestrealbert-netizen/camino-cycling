-- Ejecuta este archivo en Supabase > SQL Editor.
create table if not exists public.workouts (
  id uuid primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  workout_date date not null,
  type text not null,
  planned_minutes integer not null check (planned_minutes between 0 and 1000),
  target_rpe text, target_zone text, target_cadence text,
  objective text, description text not null, nutrition text,
  completed boolean not null default false,
  actual_minutes integer, distance_km numeric, elevation_m integer,
  actual_rpe integer check (actual_rpe between 1 and 10),
  avg_power integer, avg_hr integer, avg_cadence integer, notes text,
  updated_at timestamptz not null default now()
);
create index if not exists workouts_user_date_idx on public.workouts(user_id, workout_date);
alter table public.workouts enable row level security;
revoke all on table public.workouts from anon;
revoke all on table public.workouts from authenticated;
grant select, insert, update, delete on table public.workouts to authenticated;
drop policy if exists "Users read own workouts" on public.workouts;
drop policy if exists "Users insert own workouts" on public.workouts;
drop policy if exists "Users update own workouts" on public.workouts;
drop policy if exists "Users delete own workouts" on public.workouts;
create policy "Users read own workouts" on public.workouts for select to authenticated using ((select auth.uid()) = user_id);
create policy "Users insert own workouts" on public.workouts for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Users update own workouts" on public.workouts for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "Users delete own workouts" on public.workouts for delete to authenticated using ((select auth.uid()) = user_id);
