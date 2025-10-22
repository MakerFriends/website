// @ts-check
import { defineConfig } from "astro/config";
import tailwindcss from "@tailwindcss/vite";
import sitemap from "@astrojs/sitemap";
// Image optimization is built into Astro 5.x - no separate package needed
// Compression is handled by Cloudflare Pages automatically



// https://astro.build/config
export default defineConfig({
  site: "https://makerfriends.com",
  output: "static",
  integrations: [sitemap()],
  devToolbar: {
    enabled: false, // Disable dev toolbar to avoid module loading issues
  },
  image: {
    domains: ["images.unsplash.com"], // Allow external images
  },
  vite: {
    plugins: [tailwindcss()],
    server: {
      fs: {
        strict: true,
      },
      headers: {
        'X-Frame-Options': 'DENY',
        'X-Content-Type-Options': 'nosniff',
        'X-XSS-Protection': '1; mode=block',
        'Referrer-Policy': 'strict-origin-when-cross-origin',
        'Permissions-Policy': 'camera=(), microphone=(), geolocation=()',
      },
    },
  },
});
