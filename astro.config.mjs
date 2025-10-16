// @ts-check
import { defineConfig } from 'astro/config';

import tailwindcss from '@tailwindcss/vite';

// https://astro.build/config
export default defineConfig({
  site: 'https://makerfriends.com',
  output: 'static',
  devToolbar: {
    enabled: false  // Disable dev toolbar to avoid module loading issues
  },
  image: {
    domains: ['images.unsplash.com'],  // Allow external images
  },
  vite: {
    plugins: [tailwindcss()],
    server: {
      fs: {
        strict: true
      }
    }
  }
});