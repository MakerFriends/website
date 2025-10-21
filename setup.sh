#!/bin/bash
# Setup script for MakerFriends project

echo "🚀 Setting up MakerFriends project..."

# Check if nvm is installed
if ! command -v nvm &> /dev/null; then
    echo "❌ nvm is not installed. Please install nvm first:"
    echo "   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash"
    echo "   Then restart your terminal and run this script again."
    exit 1
fi

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Use the Node version specified in .nvmrc
echo "📦 Using Node.js version from .nvmrc..."
nvm use

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
