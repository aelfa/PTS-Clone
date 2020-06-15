# PTS-Clone
# Integrating Mrdoob/rccup

ENVS for the setup

UPLOADS = can be used from 1 - 20
BWLIMITSET = 10 - 100
GCE = true or false  for maxout  the upload speed 
PLEX = true or false
TZ = for local timezone 
DISCORD_WEBHOOK_URL = for using Discord to track the Uploads
DISCORD_ICON_OVERRIDE = Discord Avatar 
DISCORD_NAME_OVERRIDE = Name for the Discord Webhook User
LOGHOLDUI = When Diacord-Webhook is not used, the Complete Uploads will stay there for the minutes you setup
PLEX_SERVER_IP="plex" = you can use IP and localhost and traefik_proxy part 
PLEX_SERVER_PORT="32400" = the plex port (! local accesible !)




NOTE:

SAMPLE FOR BWLIMITSET AND UPLOADS 

BWLIMITSET  is set to 100
UPLOADS     is set to 10 

BWLIMITSET  / UPLOADS  = REAL UPLOADSPEED PER FILE 


NOTE: Running Plex Server and Docker Uploader at the same time / same host
it will use follow variables for this

When streams are running :


BWLIMITSET = see above 
PLEX_PLAYS = inside running command

BWLIMITSET / PLEX_PLAYS = UPLOADSPEED per file
When no_streams are running or under 2 streams :


BWLIMITSET = see above
UPLOADS = see above 

BWLIMITSET / UPLOADS = UPLOADSPEED per file
VOLUMES:

Folder for uploads              =  - /mnt/move:/move
Folder for config               =  - /opt/uploader:/config
Folder for the plex Preference  =  - /opt/uploader/plex:/app/plex
Dolder for merged contest       =  - /mnt/<pathofmergerfsrootfolder>:/unionfs
PORTS

PORT A ( HOST )      = 7777
PORT B ( CONTAINER ) = 8080
Uploader
Uploader will look for remotes in the *rclone.conf* starting with PG, GD, GS to upload with

Default files to be ignored by Uploader are


! -name '*partial~'
! -name '*_HIDDEN~'
! -name '*.fuse_hidden*'
! -name '*.lck'
! -name '*.version'
Default folders to be ignored by Uploader are


! -path '.unionfs-fuse/*'
! -path '.unionfs/*'
! -path '*.inProgress/*'
! -path '**torrent/**' 
! -path '**nzb/**' 
! -path '**backup/**' 
! -path '**nzbget/**' 
! -path '**jdownloader2/**' 
! -path '**sabnzbd/**' 
! -path '**rutorrent/**' 
! -path '**deluge/**' 
! -path '**qbittorrent/**')
You can add additional ignores using the ENV ADDITIONAL_IGNORES e.g.


-e "ADDITIONAL_IGNORES=! -path '*/SocialMediaDumper/*' ! -path '*/test/*'"
CHANGELOG
Whats new in this UPLOADER :

WebUI is colored
s6-overlay is using the latest version
alpine-docker-image is using latest version
some ENV are added for more user friendly systems [ see above ENVS ]
mobile version is included
it will automatically reduce the bandwidth when plex is running [ see above ENVS ]
it will not max out the upload speed [ see above ENVS ]
Preference.xml will now edit to docker-preferences.xml
2 failsafe mods for reading/edit the docker-preferences.xml and /app/plex folder
NEW FEATURES in the next time !!
Bug or Feature Requests
I don't open the original repo for the world,

You want a feature or you found a bug,

https://github.com/doob187/uploader-bug-tracker/issues

sinple create here a issue for bug or feature requests


ORIGINAL CODER \ CREDITS
Original coder is physk/rclone-mergerfs on gitlab

