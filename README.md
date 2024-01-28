This is the reposity containing all my config files that I want to keep from a setup to another and versionate. 

## Global organisation

The `root` folder mimics the `/` folder. This mean that the file `root/etc/example` is the file located at `/etc/example` on the host.

My customs configs that doesn't belong to a specific path are available under `root/home/bhasher/.config/custom`. This is done to reduce the risk of unexpected collisions.

## Scripts

Three scripts are available in the `scripts` folder.
- `sync.sh` create hardlinks between the files under `root` and `/`. **The command erase any previous file at those locations. Be careful**.
- `encrypt.sh [path]` encrypt the file specific using a key stored in the `key` file. This prevent leakage of private information.
- `decrypt.sh` recursively decrypt all `.enc` in the root folder.
