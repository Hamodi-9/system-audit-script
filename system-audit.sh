#!/bin/bash

# System Audit Script

echo "======================================" 
echo "🖥️  System Audit Report - $(date)"
echo "======================================"

# Hostname and Uptime
echo "📍 Hostname: $(hostname)"
echo "⏳ Uptime: $(uptime -p)"
echo

# CPU Info
echo "🧠 CPU Info:"
lscpu | grep 'Model name\|Architecture\|CPU(s)'
echo

# Memory Info
echo "🧠 Memory Info:"
free -h
echo

# Disk Usage
echo "💾 Disk Usage:"
df -h --total | grep 'total'
echo

# Running Processes
echo "⚙️  Top 5 Running Processes:"
ps aux --sort=-%mem | head -n 6
echo

# Open Ports
echo "🔐 Open Ports:"
ss -tuln | grep LISTEN
echo

# Logged In Users
echo "👤 Logged In Users:"
who
echo

echo "✅ Audit complete."
