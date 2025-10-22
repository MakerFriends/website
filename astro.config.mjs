// @ts-check
import { defineConfig } from "astro/config";
import tailwindcss from "@tailwindcss/vite";
import sitemap from "@astrojs/sitemap";
import image from "@astrojs/image";
import { compression } from "vite-plugin-compression";



// https://astro.build/config
export default defineConfig({
  site: "https://makerfriends.com",
  output: "static",
  integrations: [sitemap(), image()],
  devToolbar: {
    enabled: false, // Disable dev toolbar to avoid module loading issues
  },
  image: {
    domains: ["images.unsplash.com"], // Allow external images
  },
  vite: {
    plugins: [
      tailwindcss(),
      compression({
        algorithm: "gzip",
        ext: ".gz",
        deleteOriginFile: false,
      }),
    ],
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
