#!/bin/sh

# Download and install Racket
curl -sSo /tmp/install-racket https://mirror.racket-lang.org/installers/7.4/racket-7.4-x86_64-linux.sh
/bin/sh /tmp/install-racket --in-place --dest /tmp/racket

# Install Pollen lang
/tmp/racket/bin/raco pkg install --auto pollen

# Render the static pages
/tmp/racket/bin/raco pollen render
# Render homepage explicitly for now:
/tmp/racket/bin/raco pollen render index.html.pm

# Build JS and CSS
yarn build
