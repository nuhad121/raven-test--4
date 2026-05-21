-- Run once in Supabase SQL Editor (optional but recommended)
-- Stops duplicate phone at database level

CREATE UNIQUE INDEX IF NOT EXISTS raven_users_phone_unique
ON public.raven_users (phone)
WHERE phone IS NOT NULL AND phone <> '';
