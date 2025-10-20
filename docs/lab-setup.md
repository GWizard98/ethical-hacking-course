# Lab Setup (Local, Safe)

This course uses only authorized targets. Use the lab locally via Docker.

## Quick start (Docker)
- Prereq: Docker Desktop installed
- Start a safe web demo app (OWASP Juice Shop):
```sh path=null start=null
docker compose -f labs/docker-compose.yml up -d
```
- Access: http://localhost:3000
- Stop:
```sh path=null start=null
docker compose -f labs/docker-compose.yml down
```

## Optional VM-based lab
- Create an isolated VM (e.g., Ubuntu LTS) and snapshot before exercises.
- Network: NAT or host-only. Do not expose to the internet.

## Safety reminders
- Use only the provided local targets or reputable CTF platforms.
- Never test systems without explicit written permission.
