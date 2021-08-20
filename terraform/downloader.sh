#!/bin/sh -ex

TERRAFORM_VERSION=$1
OUTPUT=$2

function replaced_arch () {
    ARCH=$(arch)
    case ${ARCH} in
        aarch64)
            echo -n 'arm64'
        ;;
        x86_64)
            echo -n 'amd64'
        ;;
        *)
            echo ${ARCH}
        ;;
    esac
}

wget -O ${OUTPUT} "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_$(replaced_arch).zip"
