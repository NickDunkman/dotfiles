#!/usr/bin/env bash
set -euo pipefail

ANKI_CONNECT_URL="http://localhost:8765"
ANKI_MEDIA_DIR="$HOME/Library/Application Support/Anki2/User 1/collection.media"

OLD_JS_FILEPATH=$(find -E "$ANKI_MEDIA_DIR" -type f -regex ".*_nick_anki\.[0-9]+\.js")
if [ -z "$OLD_JS_FILEPATH" ]; then
  echo "Could not find existing _nick_anki JS file in Anki media directory."
  exit 1
fi

# Determine old version & new version numbers based on the .js file
OLD_VERSION="${OLD_JS_FILEPATH##*_nick_anki.}"; OLD_VERSION="${OLD_VERSION%.js}"
NEW_VERSION=$((OLD_VERSION + 1))

# Copy JS/CSS files into Anki media directory with new version number
rm -f "$ANKI_MEDIA_DIR/_nick_anki.$OLD_VERSION.js"
rm -f "$ANKI_MEDIA_DIR/_nick_anki.$OLD_VERSION.css"
cp "$DOTFILES/anki/_nick_anki.css" "$ANKI_MEDIA_DIR/_nick_anki.$NEW_VERSION.css"
cp "$DOTFILES/anki/_nick_anki.js" "$ANKI_MEDIA_DIR/_nick_anki.$NEW_VERSION.js"

# -------------------------------
# Launch Anki & wait until its ready
# -------------------------------
if ! pgrep -f "Anki" >/dev/null; then
  open --background -a Anki
fi
until curl -s "$ANKI_CONNECT_URL" >/dev/null; do
  sleep 1
done

# Function to make a POST to Anki via AnkiConnect
ac() {
  curl -s "$ANKI_CONNECT_URL" -X POST -d "$1"
}

# -------------------------------
# Get all model names safely
# -------------------------------
ac '{
  "action": "modelNames",
  "version": 6
}' | jq -r '.result[]' | while IFS= read -r MODEL; do

  # -------------------------------
  # Get all templates for this model
  # -------------------------------
  TEMPLATES_JSON=$(ac "{
    \"action\": \"modelTemplates\",
    \"version\": 6,
    \"params\": {\"modelName\": \"$MODEL\"}
  }")

  # Loop over each card template name (Card 1, Card 2, etc)
  echo "$TEMPLATES_JSON" \
    | jq -r '.result | keys[]' \
    | while IFS= read -r CARD; do

        # Extract the front template
        FRONT=$(echo "$TEMPLATES_JSON" | jq -r ".result[\"$CARD\"].Front")

        # Swap in the new version number
        NEW_FRONT=$(echo "$FRONT" | sed -E "s/_nick_anki.[0-9]+.js/_nick_anki.$NEW_VERSION.js/g" | sed -E "s/_nick_anki.[0-9]+.css/_nick_anki.$NEW_VERSION.css/g")

        # Skip write if no change
        if [[ "$NEW_FRONT" == "$FRONT" ]]; then
          continue
        fi

        # JSON escape
        NEW_FRONT_JSON=$(printf '%s' "$NEW_FRONT" | jq -Rs '.')

        # Write the updated front template back to Anki
        ac "{
          \"action\": \"updateModelTemplates\",
          \"version\": 6,
          \"params\": {
            \"model\": {
              \"name\": \"$MODEL\",
              \"templates\": {
                \"$CARD\": {
                  \"Front\": $NEW_FRONT_JSON
                }
              }
            }
          }
        }" >/dev/null
    done
done
