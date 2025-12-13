#!/bin/bash

# Discord Webhook Notification Script
# Usage: ./discord-notify.sh <webhook_url> <status> <commit_sha> <commit_message> <author> [deployment_url]

WEBHOOK_URL=$1
STATUS=$2
COMMIT_SHA=$3
COMMIT_MESSAGE=$4
AUTHOR=$5
DEPLOYMENT_URL=$6

if [ "$STATUS" == "success" ]; then
  TITLE="A new version of Pokedex successfully deployed"
  SEVERITY="Informational"
  COLOR=5763719  
  if [ -n "$DEPLOYMENT_URL" ]; then
    DESCRIPTION="available at $DEPLOYMENT_URL by $AUTHOR\\n\\nSeverity: $SEVERITY"
  else
    DESCRIPTION="by $AUTHOR\\n\\nSeverity: $SEVERITY"
  fi

elif [ "$STATUS" == "failure" ]; then
  TITLE="Build failed"
  SEVERITY="Error"
  COLOR=15548997
  
  # Use GITHUB_REPOSITORY if available, otherwise use a placeholder
  REPO=${GITHUB_REPOSITORY:-"demouser/testrepo"}
  COMMIT_URL="https://github.com/$REPO/commit/$COMMIT_SHA"
  
  DESCRIPTION="commit\\n$COMMIT_URL by $AUTHOR broke the build :(\\n\\nSeverity: $SEVERITY"
fi

JSON_PAYLOAD=$(cat <<EOF
{
  "embeds": [{
    "title": "$TITLE",
    "description": "$DESCRIPTION",
    "color": $COLOR
  }]
}
EOF
)

# Send to Discord
curl -H "Content-Type: application/json" \
     -d "$JSON_PAYLOAD" \
     "$WEBHOOK_URL"
