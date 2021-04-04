#!/bin/sh

if test ! $(which rustc)
then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi