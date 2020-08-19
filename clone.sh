#!/bin/bash
function sudocheck () {
  if [[ $EUID -ne 0 ]]; then
    tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  You Must Execute as a SUDO USER (with sudo) or as ROOT!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
    exit 0
  fi
}

function clone() {
    sudo rm -rf /opt/pgclone
    sudo git clone --quiet https://github.com/doob187/pgclone.git /opt/pgclone
    sudo chown -cR 1000:1000 /opt/pgclone/
    sudo chmod -cR 755 /opt/pgclone
    sudo bash /opt/pgclone/pgclone.sh
}
sudocheck
clone
