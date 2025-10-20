# Capstone Exemplar — Strong

Planning
- Scope local demo app; constraints documented; safety affirmed.

Discovery
- Reproducible steps with timestamps; screenshots of key flows (redacted).

Findings (sample)
1) Weak input validation in search feature (conceptual). Evidence: request/response notes. Impact: reflected content; low risk in local demo. Mitigation: server-side validation + output encoding.
2) Session handling improvement: short token rotation interval. Evidence: cookie attributes. Mitigation: HttpOnly, Secure, rotation.

Mitigations
- Prioritized list with feasibility and owner.

Appendix
- Notes, artifacts references.
