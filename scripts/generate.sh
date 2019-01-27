#!/usr/bin/env bash

set -eu

USER="$1"
REPO="$2"

VERSION=`curl https://api.github.com/repos/${USER}/${REPO}/releases/latest | jq -r .tag_name`
BINARY_FILE_NAME="${REPO}-${VERSION}-x86_64-apple-darwin.tar.gz"
RELEASE_URL="https://github.com/${USER}/${REPO}/releases/download/${VERSION}/${BINARY_FILE_NAME}"

curl -L -O "${RELEASE_URL}"

SHASUM=`shasum -a 256 ${BINARY_FILE_NAME} | cut -f 1 -d " "`
DESCRIPTION=`curl https://api.github.com/repos/${USER}/${REPO} | jq -r .description`

echo "class ${REPO^} < Formula
  desc '${DESCRIPTION}'
  homepage 'https://github.com/${USER}/${REPO}'
  url '${RELEASE_URL}'
  version '${VERSION}'
  sha256 '${SHASUM}'

  def install
    bin.install '${REPO}'
  end
end" > ${REPO}.rb

rm ${BINARY_FILE_NAME}
