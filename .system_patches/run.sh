#!/bin/bash

timmy_apply_patches() {
  local files=$(find ~/.system_patches/ -name '*.patch')
  local basedir=$(echo ~/.system_patches/)
  for origfile in $files; do
    local patchfile=$(echo $origfile | sed -e "s#$basedir\(.*\)\.patch#/\1#")
    echo "Patching from $origfile -> $patchfile"
    [[ ! -f $patchfile ]] && sudo touch $patchfile
    if [[ $(sudo grep "PATCH FROM $(basename $origfile)" $patchfile) ]]; then
      echo "Already patched ... skipping ($patchfile)"
    else
      sudo patch --verbose $patchfile $origfile
    fi
  done
}

