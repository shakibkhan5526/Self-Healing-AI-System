#!/bin/bash
# Start the Self-Healing Cloud System frontend
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/frontend"

echo "🌐 Starting Self-Healing Cloud System Frontend..."
echo "   React + Vite on http://localhost:5173"
echo ""

npm run dev
