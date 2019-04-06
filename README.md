# gitget

Clones git repositories into a single folder organized by username and repo name.

## Usage

```bash
# Usage: `gitget.sh <source_repository> <destination_folder>`

# Current valid URLs
# git://github.com/some-user/my-repo.git
# git@github.com:some-user/my-repo.git
# https://github.com/some-user/my-repo.git


$ gitget.sh git://github.com/moonmeister/gitget.git ~/code


# Would clone the repository to:

# Linux:
/home/<username>/code/moonmeister/gitget

# macOS:
/Users/<username>/code/moonmeister/gitget

```

## Setup Destination

Instead of typing a destination every time you can set it via an environment variable. If you want to override this passing in a different destination will override the environment variable.

```bash
$ export CODE_PATH=~/code
```

## Setup Alias

```bash
# Setup alias
$ alias gg="$CODE_PATH/code/moonmeister/get-git/getgit.sh"

# Now you can run
$ gg git://github.com/moonmeister/gitget.git

```

I'd recommended this export and alias be added to your bash profile so they are availble permanently.

https://stackoverflow.com/questions/14524590/how-to-add-export-statement-in-a-bash-profile-file

## Contribute

I'd love if you contributed to making this better!

Here are a few features I can think of if you don't have any:

- [ ] Allow for `https://github.com/some-user/my-repo` URLs (no `.git` extension)
- [ ] Allow for `github.com/some-user/my-repo` URLs (no `.git` extension or protocol)
- [ ] Installers for various package managers
