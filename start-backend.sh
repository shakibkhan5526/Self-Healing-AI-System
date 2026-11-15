#!/bin/bash
# Start the Self-Healing Cloud System backend
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/backend"

echo "🚀 Starting Self-Healing Cloud System Backend..."
echo "   FastAPI + Uvicorn on http://localhost:8000"
echo "   API Docs: http://localhost:8000/docs"
echo ""

python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
