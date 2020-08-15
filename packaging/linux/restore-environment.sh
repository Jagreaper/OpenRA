#!/bin/sh

# Restore the environment variables that were set by AppRun
export PATH="${OPENRA_ORIG_PATH}"
export XDG_DATA_DIRS="${OPENRA_ORIG_XDG_DATA_DIRS}"
export DYLD_LIBRARY_PATH="${OPENRA_ORIG_DYLD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="${OPENRA_ORIG_LD_LIBRARY_PATH}"
unset OPENRA_ORIG_PATH OPENRA_ORIG_XDG_DATA_DIRS OPENRA_ORIG_DYLD_LIBRARY_PATH OPENRA_ORIG_LD_LIBRARY_PATH

unset MONO_PATH MONO_CFG_DIR MONO_CONFIG
if [ -n "${OPENRA_ORIG_MONO_PATH}" ]; then
	export MONO_PATH="${OPENRA_ORIG_MONO_PATH}"
fi

if [ -n "${OPENRA_ORIG_MONO_CFG_DIR}" ]; then
	export MONO_CFG_DIR="${OPENRA_ORIG_MONO_CFG_DIR}"
fi

if [ -n "${OPENRA_ORIG_MONO_CONFIG}" ]; then
	export MONO_CONFIG="${OPENRA_ORIG_MONO_CONFIG}"
fi

unset SDL_VIDEO_X11_WMCLASS OPENRA_ORIG_MONO_PATH OPENRA_ORIG_MONO_CFG_DIR OPENRA_ORIG_MONO_CONFIG

# Run the given command
exec "$@"