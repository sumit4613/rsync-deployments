#!/bin/bash

set -eu

# Set deploy key
SSH_PATH="$HOME/sumit/.ssh"
mkdir "$SSH_PATH"
echo "$DEPLOY_KEY" > "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key"


# Do deployment
sh -c "rsync ${INPUT_RSYNC_OPTIONS} -e 'ssh -i ${SSH_PATH/deploy_key} -o StrictHostKeyChecking=no' $GITHUB_WORKSPACE${INPUT_RSYNC_BASEDIR:-"/"} ${INPUT_RSYNC_TARGET}"