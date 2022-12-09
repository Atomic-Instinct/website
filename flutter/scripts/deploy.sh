#!/usr/bin/env bash

set -e

flutter clean
flutter build web --web-renderer html

rm -r ../public
mkdir ../public
cp -r build/web/** ../public
cp -r ../public/assets/assets/images ../public/assets

cd ..
firebase deploy --only hosting