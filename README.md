# Deluge in the sky (azure)

## What's this for?

Deluge is a torrent client for hosting linux distros. Some linux distros need to be seeded semi-permanently because they rely on seed time vs dl/ul ratios. This is for that kind of seeding.

## How did I use this?

- az login
- `touch .env`
- fill envs
``` 
  export REGION=westus
  export RESOURCE_GROUP=torrents
  export STORAGE_ACCOUNT=torrentstore
  export SHARE_NAME=torrents
  export CONTAINER_NAME=deluge
  export IMAGE=ghcr.io/linuxserver/deluge
  export DNS_LABEL=tinted-washcloth # This needs to be unique in the region
```
- source the envs `. ./.env`
- `./create_resource_group.sh`
- `./create_fileshare.sh`
- `./create_deluge_container.sh`
- go to your app http://tinted-washcloth.westus2.azurecontainer.io:8112/
- pw is deluge
- set the pw
- set the download locacation to /config/downloads/
- set the auto-add plugin
  - set the auto-add path to /config/watch
  - you may need to create the folder in the share