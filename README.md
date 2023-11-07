# WallpaperSH
Shell Script code for live Wallpaper .mp4 on i3wm

First to use this script change the path of the videos in wallpaper.sh

After, in the repository /WallpaperSH/ as root, use:
$ chmod a+x wallpaper.sh

To execute:
$ ./wallpaper.sh

To automatic open with i3wm, use:
$ echo "exec --no-startup-id /path/to/WallpaperSH/wallpaper.sh" >> /home/user/.config/i3/config

Notes:
- This script only works in a i3wm, with a single monitor.
- You must have the videos (.mp4) saves in a repository.
