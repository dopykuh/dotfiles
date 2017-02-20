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

timmy_install_packages() {
  for i in ~/.system_patches/packages.*; do
    if [[ -f $i ]]; then
      local tool=$(echo $i | grep -oP 'packages\.\K.*')
      while read pkg; do
        echo "$tool install $pkg"
      done <<< $(grep -v '^#' $i)
    fi
  done
}
