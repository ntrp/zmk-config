#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function build() {
  west build --pristine -b "nice_nano_v2" -- -DZMK_CONFIG="$DIR/config" -DSHIELD="corne_${1}"
  cp build/zephyr/zmk.uf2 "${DIR}/corne_${1}.uf2"
}

function build_reset() {
  west build --pristine -b "nice_nano_v2" -- -DZMK_CONFIG="$DIR/config" -DSHIELD="settings_reset"
  cp build/zephyr/zmk.uf2 "${DIR}/settings_reset.uf2"
}

cd zmk/app

build "left"
build "right"
build_reset

