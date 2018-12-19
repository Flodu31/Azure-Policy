#!/bin/bash
az account set --subscription ${1}
path=${2}
rulesPath="$path/PublicIPRestriction/azurepolicy.rules.json"
az policy definition create --name 'restrict-public-ip' --display-name 'Restrict Public IP' \
    --description 'Restrict Public IP resource from being associated to a NIC' \
    --rules $rulesPath --mode All

az policy assignment create --name 'Restrict Public IP' --scope * --policy "restrict-public-ip" 