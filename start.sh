#!/bin/bash
cd /home/docker/actions-runner

./config.sh --url https://github.com/MIS-CodeRepo --token ARPME5QSO23EJNRF6KDZ4I3FNK7YG

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ARPME5QSO23EJNRF6KDZ4I3FNK7YG
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!
