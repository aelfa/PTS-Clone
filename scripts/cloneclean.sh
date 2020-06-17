#!/bin/bash
#
# Title:      remove the old garbage files
# MOD from MrDoobPG
# fuck of all haters
# GNU:        General Public License v3.0
################################################################################
if pidof -o %PPID -x "$0"; then
    exit 1
fi

startscript () {
while true; do
chown -cR 1000:1000 "$(cat /var/plexguide/server.hd.path)/downloads"
chmod -cR 775 "$(cat /var/plexguide/server.hd.path)/downloads"
#TORRENT
find "$(cat /var/plexguide/server.hd.path)/downloads/torrent/" -mindepth 1 -type f -cmin +"$(cat /var/plexguide/cloneclean.torrent)" 2>/dev/null -exec rm -rf {} \;
find "$(cat /var/plexguide/server.hd.path)/downloads/torrent/" -mindepth 1 -type d -empty -amin +"$(cat /var/plexguide/cloneclean.torrent)" 2>/dev/null -exec rm -rf {} \;
#ALL
find "$(cat /var/plexguide/server.hd.path)/downloads/" -mindepth 2 -type d -empty -delete
sleep 5
bash /opt/pgclone/scripts/unwantedremover.sh
done
}
# keeps the function in a loop
cheeseballs=0
while [[ "$cheeseballs" == "0" ]]; do startscript; done
