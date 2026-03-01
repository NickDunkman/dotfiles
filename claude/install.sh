if ! type "claude" > /dev/null; then
    curl -fsSL https://claude.ai/install.sh | bash
else
    claude update
fi
