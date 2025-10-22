// @ts-check
import { defineConfig } from "astro/config";
import sitemap from "@astrojs/sitemap";

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
