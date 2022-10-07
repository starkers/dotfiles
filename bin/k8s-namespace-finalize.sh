#!/usr/bin/env bash

# script will remove any finalizers from a namespace

# open the proxy first with `kubectl proxy`

# run the script with an argument of the name of  the NS

export PORT=8001
export NS="${1}"
BLOB=$(
	cat <<EOF
{
  "kind": "Namespace",
  "apiVersion": "v1",
  "metadata": {
    "name": "$NS"
  },
  "spec": {
    "finalizers": null
  }
}
EOF
)

curl -0 -X PUT "http://localhost:${PORT}/api/v1/namespaces/${NS}/finalize" \
	-H "Content-Type: application/json" \
	--data-binary "${BLOB}"
