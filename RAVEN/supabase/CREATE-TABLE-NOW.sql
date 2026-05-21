-- RAVEN: copy ALL lines → Supabase SQL Editor → RUN
-- Project: unibhpcybywpffntuvxd

CREATE TABLE public.raven_users (
  id TEXT NOT NULL,
  name TEXT NOT NULL DEFAULT '',
  email TEXT NOT NULL,
  phone TEXT DEFAULT '',
  password TEXT DEFAULT '',
  verified BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  orders JSONB NOT NULL DEFAULT '[]'::JSONB,
  CONSTRAINT raven_users_pkey PRIMARY KEY (id),
  CONSTRAINT raven_users_email_key UNIQUE (email)
);

ALTER TABLE public.raven_users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "allow_insert" ON public.raven_users FOR INSERT WITH CHECK (true);
CREATE POLICY "allow_select" ON public.raven_users FOR SELECT USING (true);
CREATE POLICY "allow_update" ON public.raven_users FOR UPDATE USING (true);

CREATE UNIQUE INDEX IF NOT EXISTS raven_users_phone_unique
ON public.raven_users (phone)
WHERE phone IS NOT NULL AND phone <> '';
