# Self-Healing Cloud System
### AI-Powered Infrastructure Monitoring, Fault Detection & Automatic Recovery

> **Academic Simulation** — All cloud infrastructure is simulated locally. No real AWS/Azure/GCP services are used.

---

## Project Introduction

The **Self-Healing Cloud System** is a final-year computer science engineering project that demonstrates an AI-driven cloud infrastructure management platform. It continuously monitors virtual servers, detects anomalies using real Machine Learning (Scikit-learn Isolation Forest), automatically recovers from failures, and provides a professional enterprise-grade dashboard.

The system implements the complete self-healing lifecycle:

```
Monitor → Detect → Analyze → Decide → Recover → Verify → Report
```

---

## Problem Statement

Modern cloud infrastructure faces constant threats from server failures, resource spikes, and performance degradation. Manual monitoring and recovery is slow, error-prone, and cannot scale. This project demonstrates how AI-driven automation can:

1. Continuously monitor infrastructure health in real time
2. Detect anomalies (not just threshold violations) using Machine Learning
3. Automatically execute structured recovery procedures
4. Provide full audit trails for every incident and recovery action
5. Enable operators to toggle between manual and automatic healing modes

---

## Objectives

- Build a complete self-healing lifecycle simulation locally
- Implement real ML anomaly detection (not hardcoded thresholds)
- Provide a professional enterprise-quality monitoring dashboard
- Demonstrate all 6 test scenarios including failure, recovery, and retry limit
- Use only free, open-source technologies — no paid APIs or cloud subscriptions

---

## System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Frontend (React + Vite)               │
│  Dashboard │ Servers │ Anomalies │ Incidents │ Settings  │
│  WebSocket client ← live updates every 5 seconds        │
└──────────────────────────┬──────────────────────────────┘
                           │ HTTP REST / WebSocket
┌──────────────────────────▼──────────────────────────────┐
│                   Backend (FastAPI)                      │
│                                                          │
│  ┌─────────────┐  ┌──────────────┐  ┌───────────────┐  │
│  │  Monitoring │  │  Healing     │  │  ML Detection │  │
│  │  Service    │  │  Engine      │  │  (Isolation   │  │
│  │  (5s poll)  │  │  (async)     │  │   Forest)     │  │
│  └──────┬──────┘  └──────┬───────┘  └───────┬───────┘  │
│         │                │                   │          │
│  ┌──────▼────────────────▼───────────────────▼───────┐  │
│  │               SQLite Database                     │  │
│  │  servers │ metrics │ incidents │ recovery_logs    │  │
│  │  anomaly_events │ system_settings                 │  │
│  └───────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
```

---

## Technology Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 18, TypeScript, Vite, Tailwind CSS v4 |
| Charts | Recharts |
| Icons | Lucide React |
| HTTP Client | Axios |
| Backend | Python 3.9+, FastAPI, Uvicorn |
| Database | SQLite (via SQLAlchemy) |
| Validation | Pydantic v2 |
| Real-time | WebSockets |
| Machine Learning | Scikit-learn (Isolation Forest), NumPy, Pandas |
| Monitoring | Psutil (optional), custom simulation engine |

---

## Features

### ✅ Implemented & Tested

| Feature | Status |
|---------|--------|
| 5 virtual server simulation | ✅ Working |
| Real-time metric generation (sine wave + noise) | ✅ Working |
| WebSocket live dashboard updates | ✅ Working |
| Isolation Forest ML anomaly detection | ✅ Working |
| Anomaly score (0–1 continuous, not threshold) | ✅ Working |
| Auto-incident creation on failure/critical | ✅ Working |
| Self-healing: Server failure scenario | ✅ Working |
| Self-healing: High CPU scenario | ✅ Working |
| Self-healing: High Memory scenario | ✅ Working |
| Failover simulation to backup node | ✅ Working |
| Recovery retry with max attempt limit | ✅ Working |
| Recovery cooldown (60s between retries) | ✅ Working |
| Auto-healing ON/OFF toggle | ✅ Working |
| Manual incident resolution | ✅ Working |
| Manual recovery retry | ✅ Working |
| SQLite persistence (survives restart) | ✅ Working |
| Metric table pruning (capped at 200/server) | ✅ Working |
| Analytics with 7-day incident frequency | ✅ Working |
| CSV export (incidents + recovery logs) | ✅ Working |
| All 8 dashboard pages | ✅ Working |
| FastAPI Swagger docs at /docs | ✅ Working |

---

## Project Folder Structure

```
Self Healing Cloud System/
├── backend/
│   ├── app/
│   │   ├── api/
│   │   │   ├── anomalies.py      # ML detection endpoints
│   │   │   ├── dashboard.py      # Stats + analytics endpoints
│   │   │   ├── incidents.py      # Incident CRUD + CSV export
│   │   │   ├── recovery.py       # Recovery log endpoints
│   │   │   ├── servers.py        # Server management + actions
│   │   │   └── settings.py       # System settings CRUD
│   │   ├── core/
│   │   │   ├── config.py         # App settings (thresholds, intervals)
│   │   │   └── websocket_manager.py  # WS broadcast manager
│   │   ├── database/
│   │   │   └── database.py       # SQLAlchemy engine + session
│   │   ├── ml/
│   │   │   └── anomaly_detector.py  # Isolation Forest model
│   │   ├── models/
│   │   │   └── models.py         # SQLAlchemy ORM tables
│   │   ├── schemas/
│   │   │   └── schemas.py        # Pydantic request/response models
│   │   ├── services/
│   │   │   ├── healing.py        # Self-healing engine
│   │   │   ├── monitoring.py     # Background monitoring loop
│   │   │   └── simulation.py     # Virtual server metric generator
│   │   └── main.py               # FastAPI app + lifespan
│   ├── cloud_system.db           # SQLite database (auto-created)
│   └── requirements.txt
├── frontend/
│   ├── src/
│   │   ├── api/
│   │   │   └── index.ts          # All API calls + TypeScript types
│   │   ├── components/
│   │   │   ├── Sidebar.tsx       # Left navigation
│   │   │   └── TopNav.tsx        # Top bar with WS status
│   │   ├── hooks/
│   │   │   └── useWebSocket.ts   # WS hook with auto-reconnect
│   │   ├── pages/
│   │   │   ├── Overview.tsx      # Main dashboard
│   │   │   ├── Servers.tsx       # Server management
│   │   │   ├── Anomalies.tsx     # AI anomaly detection
│   │   │   ├── Incidents.tsx     # Incident management
│   │   │   ├── Healing.tsx       # Self-healing engine
│   │   │   ├── Recovery.tsx      # Recovery logs
│   │   │   ├── Analytics.tsx     # Reports & charts
│   │   │   └── SettingsPage.tsx  # System settings
│   │   ├── App.tsx               # Router + WS state
│   │   ├── index.css             # Global styles
│   │   └── utils.ts              # Shared formatters + helpers
│   └── package.json
├── docs/
│   └── README.md                 # This file
├── start-backend.sh              # Backend startup script
├── start-frontend.sh             # Frontend startup script
└── README.md                     # This file (project root)
```

---

## Installation — macOS

### Prerequisites

```bash
# Check versions
python3 --version    # 3.9+
node --version       # 18+
npm --version        # 9+
```

### 1 — Clone / Navigate to Project

```bash
cd ~/Downloads/Self\ Healing\ Cloud\ System
```

### 2 — Install Backend Dependencies

```bash
pip3 install fastapi uvicorn sqlalchemy pydantic pydantic-settings \
             python-multipart websockets aiofiles scikit-learn \
             numpy pandas psutil httpx
```

### 3 — Install Frontend Dependencies

```bash
cd frontend
npm install
cd ..
```

---

## Starting the Application

### Terminal 1 — Backend

```bash
cd backend
python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```

Or use the startup script:
```bash
./start-backend.sh
```

**Backend URLs:**
- API: http://localhost:8000
- Swagger docs: http://localhost:8000/docs
- Health check: http://localhost:8000/health

### Terminal 2 — Frontend

```bash
cd frontend
npm run dev
```

Or use the startup script:
```bash
./start-frontend.sh
```

**Frontend URL:** http://localhost:5173

---

## How to Use the Dashboard

| Page | Purpose |
|------|---------|
| Overview | Live stats, CPU/Memory charts, recent incidents |
| Server Management | View all servers, control them, simulate failures |
| AI Anomaly Detection | ML model info, anomaly scores, event log |
| Incident Management | Filter, search, resolve/retry incidents |
| Self-Healing Engine | Lifecycle diagram, recovery action log |
| Recovery Logs | Full audit trail with CSV export |
| Analytics & Reports | 7-day charts, success rates, uptime data |
| Settings | Toggle auto-healing, adjust thresholds |

---

## How to Simulate Failures

### Via Dashboard

1. Go to **Server Management**
2. Click one of:
   - **Fail** — simulates complete server failure (triggers Scenario A)
   - **High CPU** — simulates CPU spike (triggers Scenario B)
   - **High Memory** — simulates memory spike (triggers Scenario C)

### Via API (curl)

```bash
# Simulate failure
curl -X POST http://localhost:8000/api/servers/web-01/action \
  -H "Content-Type: application/json" \
  -d '{"action": "simulate_failure"}'

# Simulate high CPU
curl -X POST http://localhost:8000/api/servers/api-01/action \
  -H "Content-Type: application/json" \
  -d '{"action": "simulate_high_cpu"}'

# Disable auto-healing
curl -X PUT http://localhost:8000/api/settings/auto_healing_enabled \
  -H "Content-Type: application/json" \
  -d '{"value": "false"}'
```

---

## How Self-Healing Works

### Scenario A — Server Failure

1. Monitoring detects heartbeat failure (server in FAILED mode)
2. Incident `INC-XXXXXXXX` created with severity CRITICAL
3. Recovery engine starts (if auto-healing is enabled):
   - **Step 1 — FAILOVER**: Find backup healthy server, redirect traffic
   - **Step 2 — RESTART**: Attempt to restart the failed server
   - **Step 3 — HEALTH_CHECK**: Verify server is responding
4. On success: server → HEALTHY, incident → RESOLVED
5. On failure: retry up to 3 times (with 60s cooldown)
6. After 3 failures: incident → FAILED, alert generated

### Scenario B — High CPU

1. CPU ≥ 90% threshold detected
2. Incident created (HIGH_CPU, severity HIGH)
3. Recovery: LOAD_REDISTRIBUTION → PROCESS_RESTART
4. Verification and resolution

### Scenario C — High Memory

1. Memory ≥ 90% threshold detected
2. Incident created (HIGH_MEMORY, severity HIGH)
3. Recovery: MEMORY_CLEANUP
4. Verification and resolution

---

## How AI Anomaly Detection Works

The system uses **Scikit-learn Isolation Forest** — a real unsupervised ML algorithm:

1. **Training**: The model is trained on 2,000 synthetic normal-operation samples at startup. No internet connection needed.

2. **Features**: `[cpu_usage, memory_usage, response_time, disk_usage]`

3. **Detection**: Every 15 seconds, the model runs `score_samples()` on current metrics for each active server. The raw score is normalized to `[0, 1]` where higher = more anomalous.

4. **Classification**:
   - Score < 0.3 → `NORMAL`
   - Score 0.3–0.6 → `WARNING`
   - Score ≥ 0.6 → `CRITICAL`

5. **Distinction**: ML anomalies are labeled `is_ml_detected: true`. Rule-based threshold alerts (used as fallback if model is unavailable) are clearly labeled `is_ml_detected: false`.

**Key point**: The ML model can detect anomalies that wouldn't trigger simple thresholds — e.g., unusually high disk combined with elevated latency even when CPU looks normal.

---

## Testing Instructions

### Test 1 — All Servers Healthy

```bash
curl http://localhost:8000/api/servers/
# Expected: all 5 servers with status HEALTHY (after a minute of uptime)
```

### Test 2 — Server Failure + Auto-Recovery

```bash
curl -X POST http://localhost:8000/api/servers/web-01/action \
  -H "Content-Type: application/json" -d '{"action": "simulate_failure"}'
sleep 10
curl http://localhost:8000/api/incidents/
# Expected: incident INC-XXXXXXXX created, recovery logs appear
```

### Test 3 — High CPU + Anomaly Detection

```bash
curl -X POST http://localhost:8000/api/servers/api-01/action \
  -H "Content-Type: application/json" -d '{"action": "simulate_high_cpu"}'
sleep 20
curl http://localhost:8000/api/anomalies/
# Expected: CRITICAL events with high anomaly scores
```

### Test 4 — Disable Auto-Healing

```bash
curl -X PUT http://localhost:8000/api/settings/auto_healing_enabled \
  -H "Content-Type: application/json" -d '{"value": "false"}'
curl -X POST http://localhost:8000/api/servers/web-02/action \
  -H "Content-Type: application/json" -d '{"action": "simulate_failure"}'
sleep 5
curl http://localhost:8000/api/incidents/
# Expected: incident with auto_recovery: false, no recovery logs
```

### Test 5 — Retry Limit Reached

The recovery has 20% chance of failure. Run Test 2 multiple times or:
```bash
# If an incident has status DETECTED and attempts = 3:
curl http://localhost:8000/api/incidents/
# Look for status: FAILED, recovery_attempts: 3
```

### Test 6 — Historical Data After Restart

```bash
# Stop backend (Ctrl+C), then restart:
python3 -m uvicorn app.main:app --port 8000
curl http://localhost:8000/api/incidents/
# Expected: all incidents, recovery logs, anomaly events persist in SQLite
```

---

## Limitations & Future Scope

### Current Limitations

- All server metrics are simulated (no real cloud VMs)
- Recovery actions are simulated (no actual system commands executed)
- Single-node backend (no distributed architecture)
- ML model retrains from scratch on every backend restart

### Future Scope

- Kubernetes integration (real pod health checks)
- Multi-tenant support
- Email/Slack notification integrations
- Model persistence (save trained model to disk)
- Reinforcement learning for optimal recovery strategy selection
- Historical ML model comparison dashboard
- Integration with Prometheus/Grafana

---

## API Documentation

FastAPI auto-generates interactive API docs:

- **Swagger UI**: http://localhost:8000/docs
- **ReDoc**: http://localhost:8000/redoc

Key endpoints:

| Method | Endpoint | Description |
|--------|---------|-------------|
| GET | `/api/servers/` | List all servers |
| POST | `/api/servers/{id}/action` | Execute server action |
| GET | `/api/dashboard/stats` | Dashboard KPIs |
| GET | `/api/incidents/` | List incidents (filterable) |
| POST | `/api/incidents/{id}/retry` | Retry recovery |
| GET | `/api/anomalies/` | ML detection events |
| GET | `/api/anomalies/model-info` | ML model metadata |
| POST | `/api/anomalies/analyze` | Analyze custom metrics |
| GET | `/api/recovery/` | Recovery action logs |
| GET | `/api/settings/` | All system settings |
| PUT | `/api/settings/{key}` | Update a setting |
| WS | `/ws` | Live dashboard WebSocket |

---

*Built with ❤️ as a Final Year CS Engineering Project*
