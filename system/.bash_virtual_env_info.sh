#!/usr/bin/env bash

__venv_info() {
  # venv not found
  [ ! -z ${VIRTUAL_ENV+x} ] || return
  return ${VIRTUAL_ENV##*/}
}
