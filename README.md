# Quick spaces

I created this project to organize temprorary files using consistent files structure and quick symlinks.

## Usage

Let's say that you are love playing with python and usually write some simple scripts.

You probably would like to easily create new python file without thinking a lot about its name, but you also want to store it in some reliable place.

```bash
> qs topic add python
Added topic 'python'
> qs create python
Created new 'python' directory
```

It created some folders and symlinks in `~/.quick-spaces` directory:

```bash
> tree ~/.quick-spaces 
.quick-spaces
├── links
│   └── python -> ~/.quick-spaces/topics/python/@dirs/2026-02-04T18:44:11+00:00
└── topics
    └── python
        └── @dirs
            └── 2026-02-04T18:44:11+00
```

It created verbose directory in `topics/python/@dirs` and created link to it in `links`.

Let's create one more 'python' directory and see what will happen:

```bash
> qs create python
Created new 'python' directory
> tree .quick-spaces
.quick-spaces
├── links
│   └── python -> /home/dofi4ka/.quick-spaces/topics/python/@dirs/2026-02-04T18:51:15+00:00
└── topics
    └── python
        └── @dirs
            ├── 2026-02-04T18:44:11+00:00
            └── 2026-02-04T18:51:15+00:00
```

It created new verbose directory and updated link while old directory reliably stored in `topics/` folder.

### Link to links

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

## Installation

Currently, `qs` is implemented as simple bash function.

You can try it using `source`:

```bash
source qs.sh
```

You can *install* it by copying content of `qs.sh` into your `.bashrc` or `.zshrc` file.
