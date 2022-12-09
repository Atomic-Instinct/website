#!/usr/bin/env bash

set -e

flutter clean
flutter build web --web-renderer html

cp buil/web/** ../public

cd ..
firebase deploy --only hosting