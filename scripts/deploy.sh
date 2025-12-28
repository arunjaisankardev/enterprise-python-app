#!/bin/bash
set -e

# ================================
# Enterprise Auto-Deploy Script
# ================================

# Go to project directory
cd /home/arunjaisankar/apps/enterprise-python-app

# Backup current code for rollback
echo "💾 Backing up current version..."
timestamp=$(date +"%Y%m%d%H%M%S")
backup_dir="backups/$timestamp"
mkdir -p "$backup_dir"
cp -r backend frontend requirements.txt pyproject.toml "$backup_dir"

# Pull latest code
echo "🔄 Pulling latest code from main..."
git fetch origin main
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
    git pull origin main

    # Install any new dependencies
    echo "📦 Installing dependencies..."
    source .venv/bin/activate
    pip install -r requirements.txt

    # Restart backend service
    echo "♻ Restarting backend service..."
    sudo systemctl restart enterprise-backend

    echo "✅ Deployment complete"
else
    echo "✅ No changes detected, deployment skipped"
fi
