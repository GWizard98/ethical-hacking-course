# SIEM Lab: OpenSearch + Dashboards (with sample logs)

Goal
- Stand up a minimal SIEM stack locally and visualize sample logs.

Quickstart
```sh path=null start=null
docker compose -f labs/siem/docker-compose.yml up -d
open http://localhost:5601
```

Ingest
- Filebeat ships docs/datasets/sample-syslog.log to index logs-sample.
- In Dashboards, create an index pattern for logs-sample and explore Discover.

Detection (conceptual)
- Review docs/detections/sigma-example.yml and translate logic into a Dashboards saved search or alert (manual).
- Import saved search: Dashboards → Stack Management → Saved Objects → Import `docs/detections/opensearch-saved-objects.ndjson`.

Teardown
```sh path=null start=null
docker compose -f labs/siem/docker-compose.yml down -v
```

Safety
- Stack is local only; do not ingest real-world sensitive data.
