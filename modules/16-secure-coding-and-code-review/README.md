# 16 — Secure Coding and Code Review (Language-Agnostic)

Objectives
- Recognize common secure coding issues and practice lightweight reviews.

Timebox: 90–150 min

Exercises
- Select a small code snippet (any language) with input handling; review for validation/encoding/auth.
- Write a minimal secure coding checklist; apply it to the snippet.
- Propose refactors or guards; document before/after examples.

Deliverables
- Code review checklist and a short review report.

Resources
- OWASP Cheat Sheet Series: https://cheatsheetseries.owasp.org/

Checklist
- [ ] Input validated and encoded
- [ ] Authz/authn boundaries noted
- [ ] Error handling avoids leaking secrets

Quiz (3)
1) Difference between validation and sanitization?
2) Principle of least privilege in code?
3) One safe logging practice?

Rubric
- Emerging: superficial comments
- Proficient: concrete findings and fixes
- Strong: principled checklist and examples

---
Navigation: [Course README](../../README.md) • [Outline](../../docs/outline.md)