#!/bin/bash
set -e

echo "--- Checking for Valheim Updates (SteamAppID: ${STEAMAPPID}) ---"

bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
    +login anonymous \
    +app_update "${STEAMAPPID}" validate +quit

echo "--- Preparing to start Valheim Server ---"
cd "${STEAMAPPDIR}"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./linux64

exec ./valheim_server.x86_64 \
    -name "${SERVER_NAME}" \
    -port 2456 \
    -world "${WORLD_NAME}" \
    -password "${SERVER_PASS}" \
    -savedir "${SERVER_DATA}" \
    -public 1
