#!/bin/sh
set -e

ASSET_FILE=${ASSET_FILE:=game.love}
ASSET_LIST=${ASSET_LIST:=conf.lua main.lua data libraries scripts}

git archive --format=zip -o $ASSET_FILE HEAD $ASSET_LIST
