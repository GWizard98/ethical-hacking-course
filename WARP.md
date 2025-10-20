`
# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.
``

## Repository status and tooling
- Markdown-first content repository. No build system, package manager, linter, or test framework is configured.
- If tooling is added later (e.g., static site generator, markdown linting, CI), update this file with exact commands.

## Common commands
- List all module readmes
```sh path=null start=null
ls -1 modules/*/README.md
```

- View the course outline
```sh path=null start=null
sed -n '1,200p' docs/outline.md
```

- Search across content
```sh path=null start=null
grep -RIn "keyword" docs modules
```

- Create a new module skeleton (update number/slug as needed)
```sh path=null start=null
num=13; slug="advanced-topic"
dir=$(printf "modules/%02d-%s" "$num" "$slug")
mkdir -p "$dir"
cat > "$dir/README.md" <<'EOF'
# 13 — Advanced Topic

Objectives
- ...

Deliverables
- ...
EOF
git add "$dir/README.md"
```

## Architecture and structure
- docs/outline.md: Source of truth for the course’s high-level plan and progression.
- modules/<nn-topic>/README.md: One directory per module (two-digit index + slug). Each README follows a simple pattern:
  - "Objectives": what learners should accomplish
  - "Deliverables": tangible outcomes or artifacts
- Top-level README.md: Audience, outcomes, high-level structure, code of conduct, and getting started.

## Important from README.md
- Purpose: Safety-first curriculum for beginners to reach a confident mid-level practitioner.
- Getting started: Read docs/outline.md; use only authorized targets (local VMs/containers or reputable CTF platforms); track progress by taking notes in each module under modules/.
- Safety: Only test with explicit permission; follow laws; practice responsible disclosure.

## Language-agnostic policy for future code
- This repository is language-neutral. Do not assume tools. When introducing code in any language, update this file with exact, copy-pastable commands for:
  - Environment setup/install
  - Build/compile (if applicable)
  - Lint/format
  - Tests: all tests
  - Tests: single test or filtered run
  - Run local dev server/app (if applicable)
  - Package/release (if applicable)
- Add one subsection per language/toolchain using this template:
```md path=null start=null
### <Language or Toolchain>

Setup
- <commands>

Build
- <commands>

Lint/Format
- <commands>

Test (all)
- <commands>

Test (single)
- <commands>

Run (dev)
- <commands>

Notes
- <any language-specific caveats or paths>
```

## Tooling and CI
- GitHub Actions enforce Markdown linting, link checking, prose checks (alex + Vale), accessibility (pa11y + Lighthouse), docs build/deploy, and release drafting.
- Optional local checks (no repo deps required):
  - Markdown lint
    ```sh path=null start=null
    npx --yes markdownlint-cli2 "**/*.md" "!node_modules"
    ```
  - Link check
    ```sh path=null start=null
    docker run --rm -v "$PWD":/workdir ghcr.io/lycheeverse/lychee:latest --config .lychee.toml --no-progress "**/*.md"
    ```
  - Prose (alex)
    ```sh path=null start=null
    npx --yes alex "**/*.md" --no-install
    ```
  - Prose (Vale)
    ```sh path=null start=null
    vale .
    ```
  - Pre-commit hooks (setup once)
    ```sh path=null start=null
    pipx run pre-commit install
    ```

- Module generator script
  ```sh path=null start=null
  chmod +x scripts/new-module.sh
  scripts/new-module.sh "advanced-topic" "Advanced Topic"
  ```

- Docs site (MkDocs)
  - Preview locally
    ```sh path=null start=null
    pipx run mkdocs serve
    ```
  - Quizzes (local grading)
    - Serve: `pipx run mkdocs serve`, then open a page under docs/quizzes/
  - Build locally
    ```sh path=null start=null
    pipx run mkdocs build --strict
    ```
  - CI deploys to GitHub Pages on push to main.

- Lab VM (Vagrant)
  ```sh path=null start=null
  vagrant up
  vagrant ssh
  vagrant snapshot save clean
  vagrant destroy -f
  ```
  - Build signed OVA locally
    ```sh path=null start=null
    chmod +x scripts/build-ova.sh
    scripts/build-ova.sh
    ```

- Dev Container (VS Code)
  - Open this folder in a Dev Container to get mkdocs, markdownlint, alex, and Vale preinstalled.
  - Serve docs inside container:
    ```sh path=null start=null
    mkdocs serve
    ```
