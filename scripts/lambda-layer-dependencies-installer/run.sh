#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(pwd)

installLambdaLayersNodeModules(){
    echo "Installing node_modules for \`${name}\`..."
    cd "${path}" || exit 1

    npm install
}


echo "Installing Lambda Layers dependencies"
workingDir=$(pwd)

for layer in "${SCRIPT_DIR}/../../lambda-functions/layers/"*; do
    if [ -d "${layer}" ]; then
        name=$(basename "${layer}")
        path="${layer}/nodejs"
        echo "Processing layer: ${name}"
        echo "Path: ${path}"
        installLambdaLayersNodeModules
    else
        echo "${layer} is not a directory"
    fi
done