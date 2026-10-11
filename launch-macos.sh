#!/bin/bash
set -o pipefail
amg_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd) || exit 1
amg_mode=${1:-install}
amg_root=${AMG_INSTALL_ROOT:-"$HOME/AMG_MCP_Class"}
amg_port=${AMG_PORT:-9987}
mkdir -p "$amg_root/logs" || exit 1
amg_log="$amg_root/logs/$amg_mode-$(date +%Y%m%d-%H%M%S).log"
amg_args=(--root "$amg_root" --port "$amg_port")
if [ "$amg_mode" = check ]; then amg_args+=(--check-only); fi
export PYTHONIOENCODING=utf-8
export PYTHONUTF8=1
{
    printf 'AMG_MCP / %s\n' "$amg_mode"
    printf 'System: '; uname -s
    printf 'CPU: '; uname -m
    if command -v sw_vers >/dev/null 2>&1; then sw_vers; fi
    /bin/sh "$amg_dir/install-macos.sh" "${amg_args[@]}"
} 2>&1 | tee "$amg_log"
amg_exit=${PIPESTATUS[0]}
if [ "$amg_exit" -eq 0 ]; then
    if [ "$amg_mode" = install ]; then
        printf '%s\n' 'INSTALL OK. Open touchdesigner/AMG_MCP_Class_10x10.toe, then double-click 02_Check_Mac.command.'
        printf 'AI config folder: %s\n' "$amg_root"
        if [ "${AMG_NO_OPEN:-0}" != 1 ]; then open "$amg_root"; fi
    else
        printf '%s\n' 'CHECK OK. Compare project_name above with the TD file you opened.'
    fi
else
    printf '%s\n' 'FAILED. Install Python 3.10+ first. For a check: open the TD example, enable the Bridge on port 9987, then retry.'
    printf '%s\n' 'See docs/INSTALL_MACOS.md and docs/TROUBLESHOOTING.md.'
fi
printf 'Log: %s\n' "$amg_log"
if [ "${AMG_NO_PAUSE:-0}" != 1 ]; then
    printf '%s' 'Press Enter to close... '
    read -r amg_reply
fi
exit "$amg_exit"
