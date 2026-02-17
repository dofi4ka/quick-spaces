# Quick spaces

I created this project to organize temprorary files using consistent files structure and quick symlinks.

## Usage

Add topic
```bash
qs topic <topic-name>
```

Create new directory for topic
```bash
qs create <topic-name>
```

Open new directory and do whatever you want
```bash
cd ~/Spaces/<topic-name>
```

## Demo

https://github.com/user-attachments/assets/8c16acb6-ef1a-484a-80c2-93c1d398acb0

## Installation

Copy `qs` to `/usr/bin`
```bash
make install
```

For even more quick access, you can create symlink to `~/.quick-spaces/links`:
```bash
ln -s ~/.quick-spaces/links ~/Spaces
```

## Templates

You can create `@template` directory in topic's directory and add any files here:

```bash
mkdir ~/.quick-spaces/python/@template
touch ~/.quick-spaces/python/@template/meow
```

`qs` will automatically copy files from `@template` to new directories.
