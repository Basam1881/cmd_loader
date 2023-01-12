# The ultimate collection of loading animations for Bash
Ready-to-use loading animations in ASCII and UTF-8 for easy integration into your Bash scripts.

**Have an idea for a nice-looking animation? [Please help expand the collection!](https://github.com/Silejonu/bash_loading_animations/issues/new?assignees=Silejonu&labels=enhancement&template=submit-an-animation.yml&title=%5BNew+animation%5D+)**

<div align="center">

![](demo.gif)

</div>

⚠ ***Important note:*** do not copy the raw script file from your browser or **you will have broken animations**, as the non-breaking spaces will be converted into regular spaces.

Instead, use one of the following methods to retrieve the script:
```bash
git clone https://github.com/Basam1881/bash_loading_animations
```
```bash
curl -O https://raw.githubusercontent.com/Basam1881/bash_loading_animations/main/scripts/bash_loading_animations.sh
curl -O https://raw.githubusercontent.com/Basam1881/bash_loading_animations/main/scripts/bash_loading_animations.demo
curl -O https://raw.githubusercontent.com/Basam1881/bash_loading_animations/main/loading.sh
```
```bash
wget https://raw.githubusercontent.com/Basam1881/bash_loading_animations/main/scripts/bash_loading_animations.sh
wget https://raw.githubusercontent.com/Basam1881/bash_loading_animations/main/scripts/bash_loading_animations.demo
wget https://raw.githubusercontent.com/Basam1881/bash_loading_animations/main/loading.sh
```


## Usage

./loading [MESSAGE] [LOAD_ANIMATION_NAME] [command]

```bash
chmod +x loading
./loading sleep 5
./loading -m downloading sleep 5
./loading -a metro sleep 5
./loading -m downloading -a metro sleep 5
./loading -a metro -m downloading sleep 5 # WRONG
```
<div align="left">

![](cmd.gif)

</div>

> This script is written based on https://github.com/Silejonu/bash_loading_animations