# Contributing

Thanks for your interest in improving this course. Contributions are welcome for content fixes, new exercises, and clarifications.

## Principles
- Safety-first: only reference authorized targets (personal lab/CTFs). No real targets, exploits, or sensitive data.
- Beginner-friendly: concise, actionable steps; define jargon.
- Consistent structure: each module keeps the sections: Objectives, Exercises, Deliverables, (optional) Resources.

## How to propose changes
1. Fork and branch from `main`.
2. Make edits in Markdown under `modules/` or `docs/`.
3. Open a Pull Request.
   - CI runs markdown lint and link checks.
   - Keep PRs small and focused.

## Module authoring guide
- Objectives: 2–4 bullets on outcomes.
- Exercises: concrete, safe tasks learners can complete in 30–90 minutes.
- Deliverables: what learners should produce (notes, screenshots, write-ups).
- Resources (optional): official docs or reputable learning links.
- Navigation: add links back to `README.md` and `docs/outline.md` at the bottom of each module.

## Local checks (optional)
- Markdown lint (via npx):
```sh path=null start=null
npx --yes markdownlint-cli2 "**/*.md" "!node_modules"
```
- Link check (via Docker):
```sh path=null start=null
docker run --rm -v "$PWD":/workdir ghcr.io/lycheeverse/lychee:latest --config .lychee.toml --no-progress "**/*.md"
```

## PR checklist
- [ ] Adds/updates Exercises with clear steps
- [ ] Uses safety-first language; no unauthorized targets
- [ ] Navigation links present in module(s)
- [ ] Links work; CI green
- [ ] WARP.md updated if tooling or commands changed
