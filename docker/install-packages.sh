#!/usr/bin/env sh

###
# Environment ${INSTALL_VERSION} pass from Dockerfile
###

INSTALL="openssl1.1-compat"

BUILD_DEPS=""

echo "###"
echo "# Will install"
echo "###"
echo ""
echo $INSTALL
echo ""
echo "###"
echo "# Will install build tool"
echo "###"
echo ""
echo $BUILD_DEPS
echo ""

apk add --virtual .build-deps $BUILD_DEPS && apk add $INSTALL

#/* put your install code here */#
npm i -g next@^13
npm i -g @next/swc-linux-x64-gnu
npm i -g @next/swc-linux-x64-musl
yarn

# last line
mv /var/lib/nfs /var/lib/nfs-tpl
apk del -f .build-deps && rm -rf /var/cache/apk/* || exit 1

exit 0
