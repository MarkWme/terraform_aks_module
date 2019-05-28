#!/bin/bash 

terraform init \
    -backend=true \
    -backend-config="storage_account_name=psaeuwshared" \
    -backend-config="container_name=terraform-state" \
    -backend-config="key=tfhack.mtjw.azure.tfstate"