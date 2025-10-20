# Accessibility Report

This page summarizes accessibility checks. To regenerate locally:

Build and serve site
```sh path=null start=null
pipx run mkdocs build --strict
npx --yes http-server ./site -p 8080 &
```

Run pa11y-ci and Lighthouse
```sh path=null start=null
npx --yes pa11y-ci --sitemap http://127.0.0.1:8080/sitemap.xml
npx --yes @lhci/cli autorun --collect.url=http://127.0.0.1:8080/
```

Status
- Pending initial run; CI also executes pa11y + Lighthouse on main.
