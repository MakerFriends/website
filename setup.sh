#!/usr/bin/env bash
# Setup script for MakerFriends project

set -euo pipefail

echo "🚀 Setting up MakerFriends project..."

# Check if nodenv is installed
if ! command -v nodenv >/dev/null 2>&1; then
    echo "❌ nodenv is not installed. Please install nodenv first:"
    echo "   brew install nodenv"
    echo "   Then add to your shell config:"
    echo "   export PATH=\"\$HOME/.nodenv/bin:\$PATH\""
    echo "   eval \"\$(nodenv init -)\""
    echo "   Then restart your terminal and run this script again."
    exit 1
fi

# Load nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Use the Node version specified in .node-version
echo "📦 Using Node.js version from .node-version..."
nodenv version

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Install Husky hooks
echo "🔧 Setting up Husky hooks..."
npm run prepare

echo "✅ Setup complete! You can now run:"
echo "   npm run dev     # Start development server"
echo "   npm run lint    # Run ESLint"
echo "   npm run build   # Build the project"
