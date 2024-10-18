#!/bin/bash

NAME=$1

VERSION=$( composer-cli blueprints show $NAME  -j | jq -r ".[0].body.blueprints[0].version" )

echo "$NAME: $VERSION"
