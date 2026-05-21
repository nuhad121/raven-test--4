# raven_users table দেখা যাচ্ছে না — ঠিক করুন

## আগে চেক করুন — সঠিক project?

URL-এ এই ID থাকতে হবে: **unibhpcybywpffntuvxd**

https://supabase.com/dashboard/project/unibhpcybywpffntuvxd

ভুল project খুললে table দেখা যাবে না।

---

## উপায় ১ — SQL (সবচেয়ে সহজ)

1. খুলুন: https://supabase.com/dashboard/project/unibhpcybywpffntuvxd/sql/new  
2. PC ফাইল: `supabase/CREATE-TABLE-NOW.sql` — **সব লাইন** কপি  
3. Supabase editor-এ paste  
4. নিচে ডানে **Run** (বা Ctrl+Enter)  
5. নিচে **Success. No rows returned** বা সবুজ টিক দেখুন  

**লাল error** থাকলে সেই মেসেজ স্ক্রিনশট পাঠান।

6. বাম মেনু **Table Editor** → উপরে schema **public** সিলেক্ট → **raven_users** দেখা যাবে  
7. না দেখলে Table Editor-এ **Refresh** (F5)

---

## উপায় ২ — Table Editor দিয়ে হাতে (SQL fail হলে)

1. **Table Editor** → **New table**  
2. Name: `raven_users`  
3. Schema: `public`  
4. Columns যোগ করুন:

| Name | Type | Default | Extra |
|------|------|---------|--------|
| id | text | — | Primary key |
| name | text | — | |
| email | text | — | Unique |
| phone | text | — | |
| password | text | — | |
| verified | bool | false | |
| created_at | timestamptz | now() | |
| orders | jsonb | `[]` | |

5. **Save**  
6. Table → **RLS** → Enable RLS → Add policy **for all** → allow SELECT, INSERT, UPDATE  

---

## উপায় ৩ — SQL Editor থেকে table list

SQL Editor-এ run করুন:

```sql
SELECT table_name FROM information_schema.tables
WHERE table_schema = 'public' ORDER BY table_name;
```

ফলাফলে `raven_users` থাকলে table আছে — Table Editor refresh করুন।

---

## সফল হলে

1. Admin → Customers → **Refresh**  
2. অন্য ফোন থেকে Register → আবার Refresh  
