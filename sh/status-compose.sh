#!/bin/bash

UUID=$1

JSON=$( composer-cli compose list -j )
STATUS=$( echo $JSON | jq -r ".[0].body.run[] | select(.id==\"$UUID\").queue_status" )
if [ -z "$STATUS" ]; then
  STATUS=$( echo $JSON | jq -r ".[0].body.new[] | select(.id==\"$UUID\").queue_status" )
  if [ -z "$STATUS" ]; then
    STATUS=$( echo $JSON | jq -r ".[1].body.finished[] | select(.id==\"$UUID\").queue_status" )
    if [ -z "$STATUS" ]; then
      STATUS=$( echo $JSON | jq -r ".[2].body.failed[] | select(.id==\"$UUID\").queue_status" )
      if [ -z "$STATUS" ]; then
        echo "Cannot find compose with UUUID '$1'" 1>&2
        exit 1
      fi
    fi
  fi
fi
echo "$UUID: $STATUS"
