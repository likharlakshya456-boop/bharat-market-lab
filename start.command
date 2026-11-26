#!/bin/bash
set -e
cd "$(dirname "$0")"

if [ ! -x .venv/bin/python ] || [ ! -s data/swing_summary.json ]; then
  echo "First launch: installing Market Lab and downloading NSE history."
  echo "This normally takes 10-20 minutes. Keep this window open."
  echo
  bash install.sh
fi

echo "Starting Bharat Market Lab at http://localhost:8810"
exec bash run.sh
