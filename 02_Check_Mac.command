#!/bin/bash
amg_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd) || exit 1
exec /bin/bash "$amg_dir/launch-macos.sh" check
