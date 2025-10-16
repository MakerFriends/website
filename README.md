# MakerFriends.com 🚀

A vibrant community platform connecting makers worldwide to share projects, learn new skills, and build lasting friendships through STEM/STEAM innovation.

![Astro](https://img.shields.io/badge/Astro-5.14.5-FF5D01?style=flat-square&logo=astro)
![Tailwind CSS](https://img.shields.io/badge/Tailwind-4.1.14-38B2AC?style=flat-square&logo=tailwind-css)
![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)

## 🌟 Features

- **Project Showcase**: Browse and share maker projects across multiple categories
- **Maker Directory**: Connect with talented makers worldwide
- **Blog System**: Tutorials, tips, and maker stories
- **Community Features**: Forums (coming soon), workshops, and events
- **Responsive Design**: Beautiful UI that works on all devices
- **Static Site**: Lightning-fast performance with Astro
- **Cloudflare Pages Ready**: Optimized for Cloudflare Pages deployment

## 📁 Project Structure

```
makerfriends.com/
├── public/
│   ├── favicon.svg
│   └── _redirects          # Cloudflare Pages redirects
├── src/
│   ├── components/
│   │   ├── Navigation.astro
│   │   ├── Footer.astro
│   │   └── ProjectCard.astro
│   ├── layouts/
│   │   └── Layout.astro
│   ├── pages/
│   │   ├── index.astro      # Home page
│   │   ├── about.astro      # About Us
│   │   ├── history.astro    # Our History
│   │   ├── projects.astro   # Projects Gallery
│   │   ├── makers.astro     # Maker Directory
│   │   ├── contact.astro    # Contact Form
│   │   ├── donate.astro     # Donations
│   │   ├── signup.astro     # Sign Up
│   │   ├── members.astro    # Member Benefits
│   │   ├── forum.astro      # Forum (Coming Soon)
│   │   └── blog/
│   │       ├── index.astro
│   │       └── getting-started-arduino.astro
│   └── styles/
│       └── global.css
├── astro.config.mjs
├── package.json
├── tailwind.config.mjs
├── tsconfig.json
├── wrangler.toml           # Cloudflare config
└── README.md
```

## 🚀 Quick Start

### Prerequisites

- Node.js 20 or higher
- npm or yarn package manager

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/makerfriends.com.git
cd makerfriends.com
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

4. Open your browser and navigate to `http://localhost:4321`

## 🛠️ Development

### Available Scripts

```bash
# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview

# Run Astro CLI commands
npm run astro
```

### Development Workflow

1. **Run dev server**: Start the development server with hot-reload
2. **Make changes**: Edit files in `src/` directory
3. **See updates**: Changes are reflected immediately in the browser
4. **Build**: Run `npm run build` to create production build

### Adding New Pages

1. Create a new `.astro` file in `src/pages/`:
```astro
---
import Layout from '../layouts/Layout.astro';
import Navigation from '../components/Navigation.astro';
import Footer from '../components/Footer.astro';
---

<Layout title="Page Title">
  <Navigation />
  <main class="flex-1">
    <!-- Your content here -->
  </main>
  <Footer />
</Layout>
```

2. The page will be automatically available at `/page-name`

### Adding Blog Posts

1. Create a new `.astro` file in `src/pages/blog/`:
```astro
---
import Layout from '../../layouts/Layout.astro';
// ... imports
---

<Layout title="Your Blog Post Title">
  <!-- Blog content -->
</Layout>
```

2. Update `src/pages/blog/index.astro` to include your new post in the list

## 🎨 Styling

The project uses **Tailwind CSS v4** for styling with custom configurations:

### Custom Colors
- Primary: `#3B82F6` (Blue)
- Secondary: `#F59E0B` (Amber)
- Accent: `#10B981` (Green)
- Purple: `#8B5CF6`
- Pink: `#EC4899`

### Custom Animations
- `.animate-float`: Floating animation for elements
- Custom scrollbar styling

### Modifying Styles

1. Edit `src/styles/global.css` for global styles
2. Use Tailwind classes directly in components
3. Add custom CSS in the `@layer` directive

## 🌐 Deployment to Cloudflare Pages

### Method 1: Via Cloudflare Dashboard (Recommended)

1. **Build the project**:
```bash
npm run build
```

2. **Push to Git**:
```bash
git add .
git commit -m "Ready for deployment"
git push origin main
```

3. **Connect to Cloudflare Pages**:
   - Go to [Cloudflare Dashboard](https://dash.cloudflare.com)
   - Navigate to Pages
   - Click "Create a project"
   - Connect your Git repository
   - Configure build settings:
     - **Build command**: `npm run build`
     - **Build output directory**: `dist`
     - **Node version**: `20`

4. **Deploy**: Cloudflare will automatically build and deploy your site

### Method 2: Via Wrangler CLI

1. **Install Wrangler**:
```bash
npm install -g wrangler
```

2. **Login to Cloudflare**:
```bash
wrangler login
```

3. **Build and Deploy**:
```bash
npm run build
wrangler pages deploy dist
```

### Environment Variables (if needed)

Add environment variables in Cloudflare Pages:
1. Go to your Pages project settings
2. Navigate to "Environment variables"
3. Add your variables for production/preview

### Custom Domain

1. Go to your Pages project settings
2. Navigate to "Custom domains"
3. Add your domain (e.g., `makerfriends.com`)
4. Update DNS records as instructed

## 📝 Content Management

### Updating Site Content

1. **Home Page**: Edit `src/pages/index.astro`
2. **About/History**: Edit respective files in `src/pages/`
3. **Projects**: Update project data in `src/pages/projects.astro`
4. **Makers**: Update maker profiles in `src/pages/makers.astro`

### Adding Images

1. Place images in `public/` directory
2. Reference them with `/image-name.jpg`
3. For external images, use full URLs (as currently done with Unsplash)

### Logo Placeholder

The site includes a gradient placeholder for the logo. To add your logo:

1. Add logo file to `public/` (e.g., `logo.svg` or `logo.png`)
2. Update `Navigation.astro`:
```astro
<img src="/logo.svg" alt="MakerFriends" class="w-12 h-12" />
```

## 🔧 Upgrading Dependencies

### Upgrading Astro

```bash
# Check current version
npm list astro

# Upgrade to latest version
npm install astro@latest

# Update types if needed
npm install @astrojs/ts-plugin@latest
```

### Upgrading Tailwind CSS

```bash
# Upgrade Tailwind
npm install tailwindcss@latest @tailwindcss/vite@latest

# Check for breaking changes in release notes
```

### Upgrading All Dependencies

```bash
# Check for outdated packages
npm outdated

# Update all to latest (use with caution)
npm update

# Or use npm-check-updates
npx npm-check-updates -u
npm install
```

## 🔌 Integrations

### Current Integrations
- Tailwind CSS v4

### Adding New Integrations

Astro supports many integrations. To add one:

```bash
# Example: Adding React
npx astro add react

# Example: Adding Sitemap
npx astro add sitemap
```

## 🧪 Testing

### Manual Testing Checklist

- [ ] All navigation links work
- [ ] Forms submit correctly
- [ ] Responsive design on mobile/tablet/desktop
- [ ] Images load properly
- [ ] No console errors
- [ ] SEO meta tags present

### Performance Testing

1. Use Lighthouse in Chrome DevTools
2. Run `npm run build` and check bundle size
3. Test on slow network connections

## 📊 SEO & Analytics

### SEO Features Included

- Meta descriptions on all pages
- Open Graph tags for social sharing
- Semantic HTML structure
- Fast loading times (static site)

### Adding Analytics

To add Google Analytics or other tracking:

1. Add tracking script to `src/layouts/Layout.astro`
2. Add to the `<head>` section:
```html
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## 🐛 Troubleshooting

### Common Issues

**Issue**: Build fails with "Cannot find module"
- **Solution**: Run `npm install` to ensure all dependencies are installed

**Issue**: Styles not updating
- **Solution**: Clear browser cache or restart dev server

**Issue**: Tailwind classes not working
- **Solution**: Ensure `global.css` is imported in `Layout.astro`

**Issue**: Images not loading in production
- **Solution**: Check image paths start with `/` for public directory

### Getting Help

- [Astro Documentation](https://docs.astro.build)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Cloudflare Pages Documentation](https://developers.cloudflare.com/pages)
- [MakerFriends Community Forum](https://makerfriends.com/forum) (coming soon!)

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Contribution Guidelines

- Follow existing code style
- Write descriptive commit messages
- Test your changes thoroughly
- Update documentation as needed

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Built with [Astro](https://astro.build)
- Styled with [Tailwind CSS](https://tailwindcss.com)
- Icons from [Heroicons](https://heroicons.com) and emoji
- Images from [Unsplash](https://unsplash.com)
- Hosted on [Cloudflare Pages](https://pages.cloudflare.com)

## 📞 Support

- **Email**: support@makerfriends.com
- **Website**: [makerfriends.com](https://makerfriends.com)
- **Twitter**: [@makerfriends](https://twitter.com/makerfriends)

---

Made with ❤️ by the MakerFriends Team

**Happy Making! 🚀**
