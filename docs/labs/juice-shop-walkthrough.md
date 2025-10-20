# Guided Lab: Observing a Safe Web App (Juice Shop)

This walkthrough uses the local lab target from `docs/lab-setup.md`. Stay within localhost only.

## Goal
Practice safe observation and documentation of a web app’s basic behavior without exploiting real systems.

## Steps (30–60 min)
1) Start the lab
```sh path=null start=null
docker compose -f labs/docker-compose.yml up -d
```
Visit http://localhost:3000

2) Baseline the app
- Identify main pages/routes visited.
- Note HTTP status codes for Home, Login, and Search.

3) Observe requests
- Open DevTools (Network tab). Submit a login attempt (dummy creds).
- Record request method, URL, status, and key response headers.
- Note presence of session/cookie/token in responses.

4) Inputs and validation (conceptual)
- Try entering special characters into search fields; observe client-side behavior.
- Do not run scanners. Document what you see and hypothesize safe defenses (e.g., server-side validation, output encoding).

5) Reporting
- Create a short note: environment, steps, observations, and proposed defenses.

## Teardown
```sh path=null start=null
docker compose -f labs/docker-compose.yml down
```
