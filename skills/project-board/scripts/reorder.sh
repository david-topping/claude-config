#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 || $# -gt 3 ]]; then
  echo "usage: reorder.sh <projectId> <itemId> [afterItemId]" >&2
  exit 1
fi

args=(-f projectId="$1" -f itemId="$2")
[[ $# -eq 3 ]] && args+=(-f afterId="$3")

gh api graphql "${args[@]}" -f query='
mutation($projectId: ID!, $itemId: ID!, $afterId: ID) {
  updateProjectV2ItemPosition(input: {projectId: $projectId, itemId: $itemId, afterId: $afterId}) {
    clientMutationId
  }
}'
