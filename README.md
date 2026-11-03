# Baza rozwiązań

Dziennik pracy helpdesku w formie bazy rozwiązań: tytuł, zakres (ogólne, maszyna, grupa maszyn), opis problemu, kroki do wykonania i tagi. Rozwijane kafelki, wyszukiwanie po wszystkich polach i filtr zakresu. Jeden plik statyczny (`index.html`, Tailwind przez CDN), działa na GitHub Pages. Dane są w Supabase (logowanie e-mail + hasło), w `localStorage` zapamiętywany jest tylko filtr zakresu.

Adres: https://kamilowebski.github.io/diary/

## Pliki

| Plik | Opis |
| --- | --- |
| `index.html` | cała aplikacja (HTML, Tailwind przez CDN, JS) |
| `rozwiazania.sql` | tabela `rozwiazania` i RLS (dla nowej instalacji) |
| `manifest.webmanifest` | manifest PWA (nazwa, kolory, ikony) |
| `icons/` | favicon, ikona Apple Touch, ikony 192/512 i maskable |

## Uruchomienie

1. W Supabase: SQL Editor → wklej `rozwiazania.sql` → Run. Jeśli tabela `rozwiazania` już działa, pomiń ten krok.
2. W `index.html` sprawdź `SB_URL` i `SB_KEY` na górze skryptu (klucz publishable, nie `service_role`).
3. Wrzuć zawartość repozytorium na GitHub Pages (gałąź `main`, katalog główny).
4. Konta zakładasz ręcznie: Authentication → Users → Add user (zaznacz Auto Confirm User). Opcjonalnie wyłącz rejestrację nowych użytkowników.

Wymagany jest internet: Tailwind (CDN 3.4.17 z wtyczką forms, `colors.page = #f4f7f9`), biblioteka Supabase (CDN, wersja przypięta) oraz `kamilowebski.github.io/hub/apps.js` (przycisk huba).

## Wspólny wygląd (Rejestr, Todo, Diary)

- tylko jasny motyw, tło `bg-page` (`#f4f7f9`), jeden akcent `blue-600`
- kontener `max-w-7xl mx-auto px-4 py-8 space-y-6`, nagłówek z tytułem po lewej i akcjami po prawej
- te same przyciski: główny (Dodaj, Zapisz), drugorzędny (Wyloguj, Anuluj), niebezpieczny (Usuń), ikony jako inline SVG
- logowanie jako karta `max-w-md` na stronie, okna `max-w-[560px]`, potwierdzenie `max-w-[400px]`
- przycisk huba (kwadraciki) w prawym górnym rogu na każdej stronie, ładowany z `hub/apps.js` do `<div id="hub-apps">`

## Uwagi

- Bezpieczeństwo opiera się na RLS w Supabase. Klucz „publishable" w kodzie jest bezpieczny tylko przy włączonym RLS.
- `user_id` uzupełnia baza (`auth.uid()`), aplikacja go nie wysyła.
