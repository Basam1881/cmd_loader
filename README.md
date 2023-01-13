# The ultimate collection of loading animations for Bash
Ready-to-use loading animations in ASCII and UTF-8 for easy integration into your Bash scripts.

**Have an idea for a nice-looking animation? [Please help expand the collection!](https://github.com/Silejonu/bash_loading_animations/issues/new?assignees=Silejonu&labels=enhancement&template=submit-an-animation.yml&title=%5BNew+animation%5D+)**

<div align="center">

![](demo.gif)

</div>

⚠ ***Important note:*** do not copy the raw script file from your browser or **you will have broken animations**, as the non-breaking spaces will be converted into regular spaces.

Instead, use one of the following methods to retrieve the script:
```bash
git clone https://github.com/Basam1881/cmd_loader
```
```bash
curl -O https://raw.githubusercontent.com/Basam1881/cmd_loader/main/scripts/loading.sh
curl -O https://raw.githubusercontent.com/Basam1881/cmd_loader/main/loading
```
```bash
wget https://raw.githubusercontent.com/Basam1881/cmd_loader/main/scripts/loading.sh
wget https://raw.githubusercontent.com/Basam1881/cmd_loader/main/loading
```


## Usage


```bash
# Give permission to execute the file
chmod +x loading
```
```bash
./loading [MESSAGE] [LOAD_ANIMATION_NAME] [TIME_INTERVAL] <command>
```
```bash
# The order of flags DOES matter
./loading sleep 5
./loading -m Downloading sleep 5
./loading -a moon sleep 5
./loading -t 0.1 sleep 5
./loading -m Downloading -a moon sleep 5
./loading -m Downloading -a moon -t 0.1 sleep 5

./loading -a moon -m Downloading sleep 5 # WRONG
./loading -t 0.1 -a moon -m Downloading sleep 5 # WRONG

```
<div align="left">

![](cmd.gif)

</div>

> This script is written based on https://github.com/Silejonu/bash_loading_animations