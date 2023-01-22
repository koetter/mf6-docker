#!/usr/bin/env bash

if [[ -f ./model/mfsim.nam ]]; then
  cd model && mf6
else
  echo "No model found in the model directory"
  echo ""
  mf6 --help
fi
