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
echo "Physical Memory: $(sysctl -n hw.memsize | awk '{print $1/1024/1024/1024 \" GB\"}')"
echo

# Disk Usage
echo "💾 Disk Usage:"
df -h /
echo

# Running Processes
echo "⚙️  Top 5 Running Processes (by memory):"
ps aux | sort -nk +4 | tail -n 5
echo

# Open Ports
echo "🔐 Open Ports:"
lsof -i -n | grep LISTEN
echo

# Logged In Users
echo "👤 Logged In Users:"
who
echo

echo "✅ Audit complete."
