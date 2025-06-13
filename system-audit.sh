#!/bin/bash

# macOS System Audit Script

echo "======================================"
echo "🖥️  System Audit Report - $(date)"
echo "======================================"

# Hostname and Uptime
echo "📍 Hostname: $(hostname)"
echo "⏳ Uptime: $(uptime)"
echo

# CPU Info
echo "🧠 CPU Info:"
sysctl -n machdep.cpu.brand_string
echo "CPU Cores: $(sysctl -n hw.ncpu)"
echo

# Memory Info
echo "🧠 Memory Info:"
mem_bytes=$(sysctl -n hw.memsize)
mem_gb=$(echo "scale=2; $mem_bytes / 1024 / 1024 / 1024" | bc)
echo "Physical Memory: $mem_gb GB"
echo

# Disk Usage
echo "💾 Disk Usage:"
df -h /
echo

# Running Processes
echo "⚙️  Top 5 Running Processes (by memory):"
ps aux | sort -nrk 4 | head -n 5
echo

# Open Ports
echo "🔐 Open Ports:"
lsof -iTCP -sTCP:LISTEN -n | awk '{print $1, $9}' | sort | uniq
echo

# Logged In Users
echo "👤 Logged In Users:"
who
echo

echo "✅ Audit complete."
