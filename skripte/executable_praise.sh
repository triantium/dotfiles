#!/usr/bin/env bash

TOKEN="$(pass token/chaster.app | head -n 1 | tr -d '\n')"

test_conversation='64592b909e10798e60975e42' # Lucy
conversation='64b58db70bcb3112e5f0c7ee' # Desse

#curl \
#  --location \
#  --request GET \
#  --header "Authorization: Bearer ${TOKEN}" \
#  'https://api.chaster.app/conversations' | jq
#
#curl \
#  --location \
#  --request GET \
#  --header "Authorization: Bearer ${TOKEN}" \
#  "https://api.chaster.app/conversations/${conversation}/messages"

line="$(cat "$HOME/skripte/praises" | head -n '1' | tr -d '\n')"

vim -u NONE +'1d' +'wq!' "$HOME/skripte/praises"

echo "Sending: ${line}"

echo '{}' | jq ".message=\"${line}\" " > body.json



curl \
  --location \
  --data '@body.json' \
    -H 'accept: application/json' \
    -H 'Content-Type: application/json' \
  --request POST \
  --header "Authorization: Bearer ${TOKEN}" \
  "https://api.chaster.app/conversations/${conversation}"

rm body.json
