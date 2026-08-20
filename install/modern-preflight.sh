#!/bin/bash
set -u
source /etc/os-release 2>/dev/null || true
echo "SC2026 modern compatibility preflight"
echo "OS: ${PRETTY_NAME:-unknown}"
echo "Kernel: $(uname -r)"
echo "Arch: $(uname -m)"
if command -v systemd-detect-virt >/dev/null 2>&1; then echo "Virt: $(systemd-detect-virt)"; fi
for c in bash curl wget unzip systemctl ip nft; do
  if command -v "$c" >/dev/null 2>&1; then echo "OK: $c"; else echo "MISSING: $c"; fi
done
if command -v openvpn >/dev/null 2>&1; then echo "OpenVPN: $(openvpn --version 2>/dev/null | head -n1)"; else echo "OpenVPN: not installed yet"; fi
