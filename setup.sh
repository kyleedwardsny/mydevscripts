#!/bin/sh

VIMRC="${HOME}/.vimrc"
GITIGNORE_GLOBAL="${HOME}/.gitignore_global"

if ! grep -q 'BEGIN \.vimrc by kyleedwardsny' "${VIMRC}" 2> /dev/null
then
  echo "Appending vimrc to ${VIMRC}"
  cat vimrc >> "${VIMRC}"
fi

if ! grep -q 'BEGIN \.gitignore_global by kyleedwardsny' "${GITIGNORE_GLOBAL}" 2> /dev/null
then
  echo "Appending gitignore_global to ${GITIGNORE_GLOBAL}"
  cat gitignore_global >> "${GITIGNORE_GLOBAL}"
fi

echo "Setting core.excludesfile to ${GITIGNORE_GLOBAL}"
git config --global core.excludesfile "${GITIGNORE_GLOBAL}"
