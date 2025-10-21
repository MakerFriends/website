# Contributing to MakerFriends.com

Thank you for your interest in contributing to MakerFriends.com! We welcome contributions from the maker community and appreciate your help in making this project better.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Types of Contributions](#types-of-contributions)

## Code of Conduct

This project follows our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/makerfriends.com.git
   cd makerfriends.com
   ```
3. **Create a branch** for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## How to Contribute

### Reporting Issues

- Check existing issues first
- Use the issue templates when available
- Provide detailed information about the problem
- Include steps to reproduce if it's a bug

### Suggesting Enhancements

- Use the enhancement issue template
- Clearly describe the proposed feature
- Explain why it would be valuable
- Consider implementation complexity

### Code Contributions

- Follow our coding standards
- Write tests for new features
- Update documentation as needed
- Ensure all checks pass

## Development Setup

### Prerequisites

Choose one of the following options:

#### Option 1: Containerized Development (Recommended)

Choose one of the following containerization tools:

- **Docker Desktop** + Docker Compose
- **Rancher Desktop** + Docker Compose
- **Podman** + Podman Compose
- **Colima** + Docker Compose
- **OrbStack** + Docker Compose
- Git

#### Option 2: Local Development

- **Node.js 24.9.0** (managed by nodenv)
- **nodenv** for Node.js version management
- **npm** package manager
- **Git**

### Installation

#### Using Containerized Development (Recommended)

```bash
# Clone the repository
git clone https://github.com/YOUR-USERNAME/makerfriends.com.git
cd makerfriends.com

# Start development environment (works with all Docker alternatives)
docker-compose up

# Or run in detached mode
docker-compose up -d

# For Podman users
podman-compose up
```

The site will be available at `http://localhost:4321`

#### Using Local Development

**Quick Setup (Recommended):**

```bash
# Clone the repository
git clone https://github.com/YOUR-USERNAME/makerfriends.com.git
cd makerfriends.com

# Run the automated setup script
./setup.sh
```

**Manual Setup:**

```bash
# Install nodenv (if not already installed)
brew install nodenv
mkdir -p "$(nodenv root)/plugins"
git clone https://github.com/nodenv/node-build.git "$(nodenv root)/plugins/node-build"

# Configure your shell (add to ~/.bash_profile or ~/.bashrc)
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Install Node.js version
nodenv install 24.9.0
nodenv local 24.9.0

# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

### Development Server

- **Docker**: `http://localhost:4321`
- **Local**: `http://localhost:4321`

### Containerized Development Workflow

#### Starting Development

```bash
# Start the development environment (works with all Docker alternatives)
docker-compose up

# Start in background
docker-compose up -d

# View logs
docker-compose logs -f app
```

#### Docker Alternative Setup

**Rancher Desktop**

```bash
# Install from https://rancherdesktop.io/
# Enable Docker API compatibility in settings
# Then use standard commands
docker-compose up
```

**Podman**

```bash
# Install podman-compose
# macOS: brew install podman podman-compose
# Linux: dnf install podman podman-compose
# Use podman-compose instead of docker-compose
podman-compose up
```

**Colima (macOS/Linux)**

```bash
# Install and start Colima
brew install colima
colima start --with-kubernetes=false
# Then use standard docker-compose commands
docker-compose up
```

**OrbStack (macOS)**

```bash
# Install from https://orbstack.dev/
# Provides Docker-compatible API
docker-compose up
```

#### Common Docker Commands

```bash
# Run commands inside the container
docker-compose exec app npm install
docker-compose exec app npm run build
docker-compose exec app npm run check

# Access container shell
docker-compose exec app sh

# Stop the development environment
docker-compose down

# Rebuild containers (after Dockerfile changes)
docker-compose up --build

# Remove all containers and volumes
docker-compose down -v
```

#### Hot Reload

The Docker setup includes hot reload functionality:

- Source code changes are automatically reflected
- Node modules are cached for faster rebuilds
- Astro cache is preserved between restarts

#### Production Testing

```bash
# Test production build
docker-compose --profile production up app-prod

# Access production site at http://localhost:8080
```

## Pull Request Process

1. **Update your branch** with the latest changes:

   ```bash
   git fetch origin
   git rebase origin/main
   ```

2. **Run tests and checks**:

   ```bash
   # Using Docker
   docker-compose exec app npm run check
   docker-compose exec app npm run build

   # Using Local Development
   npm run check
   npm run build
   ```

3. **Commit your changes** with a clear message:

   ```bash
   git commit -m "Add feature: brief description"
   ```

4. **Push to your fork**:

   ```bash
   git push origin feature/your-feature-name
   ```

5. **Create a Pull Request**:
   - Use the PR template
   - Provide a clear title and description
   - Link any related issues
   - Request review from maintainers

### PR Requirements

- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] Tests added/updated (if applicable)
- [ ] Build passes successfully

## Coding Standards

### Code Quality Tools

This project uses automated code quality tools:

- **ESLint**: Linting for JavaScript, TypeScript, and Astro files
- **Husky**: Pre-commit hooks that run ESLint before allowing commits
- **Prettier**: Code formatting (via VS Code extension)
- **TypeScript**: Strict type checking

### Running Code Quality Checks

```bash
# Run ESLint
npm run lint

# Auto-fix ESLint issues
npm run lint:fix

# Run ESLint in strict mode (zero warnings allowed)
npm run lint:strict
```

### General Guidelines

- Use TypeScript for type safety
- Follow existing code patterns
- Write clean, readable code
- Add comments for complex logic
- Use meaningful variable names
- **All code must pass ESLint checks before committing**

### Astro Components

- Use Astro's component syntax
- Prefer Astro components over client-side frameworks when possible
- Use proper TypeScript types
- Follow the existing component structure

### Styling

- Use Tailwind CSS classes
- Follow the existing design system
- Ensure responsive design
- Maintain accessibility standards

### File Organization

```
src/
├── components/     # Reusable components
├── layouts/        # Page layouts
├── pages/          # Route pages
├── styles/         # Global styles
└── utils/          # Utility functions
```

## Types of Contributions

### 🐛 Bug Fixes

- Fix typos or broken links
- Resolve layout issues
- Fix functionality problems
- Improve error handling

### ✨ New Features

- Add new pages or sections
- Implement new components
- Add interactive features
- Enhance user experience

### 📚 Documentation

- Improve README files
- Add code comments
- Update installation instructions
- Create tutorials or guides

### 🎨 Design & UI

- Improve visual design
- Enhance accessibility
- Optimize for mobile devices
- Add animations or interactions

### 🔧 Infrastructure

- Update dependencies
- Improve build process
- Add CI/CD improvements
- Enhance deployment scripts

## Getting Help

If you need help or have questions:

1. **Check the documentation** in the README
2. **Search existing issues** for similar problems
3. **Join our community** discussions
4. **Contact maintainers** if needed

## Recognition

Contributors will be:

- Listed in our [CONTRIBUTORS.md](CONTRIBUTORS.md)
- Mentioned in release notes for significant contributions
- Invited to join our community discussions

## Thank You

Thank you for contributing to MakerFriends.com! Your efforts help us build a better platform for the maker community. 🚀

---

_This contributing guide is maintained by the MakerFriends development team._
