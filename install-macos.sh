#!/bin/sh
set -eu
amg_script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
amg_root=${AMG_INSTALL_ROOT:-"$HOME/AMG_MCP_Class"}
amg_host=$(uname -s)
amg_path_python=$(command -v python3 2>/dev/null || true)
# Finder/Terminal PATH can differ. Reuse the class environment, then check
# installed Python distributions before trying PATH. Do not invoke Apple's
# /usr/bin/python3 stub, which can open an Xcode installation dialog.
for amg_candidate in \
    "$amg_root/.venv/bin/python" \
    /usr/local/bin/python3 \
    /Library/Frameworks/Python.framework/Versions/Current/bin/python3 \
    /opt/homebrew/bin/python3 \
    "$amg_path_python"
do
    [ -n "$amg_candidate" ] && [ -x "$amg_candidate" ] || continue
    if [ "$amg_host" = Darwin ] && [ "$amg_candidate" = /usr/bin/python3 ]; then
        continue
    fi
    if "$amg_candidate" -c 'import sys, ssl, venv; raise SystemExit(0 if sys.version_info >= (3, 10) else 1)' >/dev/null 2>&1; then
        printf 'Python: %s\n' "$amg_candidate"
        exec "$amg_candidate" "$amg_script_dir/install.py" "$@"
    fi
done
printf '%s\n' 'Install Python 3.10+ from python.org, run Install Certificates.command, then retry 01_Install_Mac.command.' >&2
exit 1
