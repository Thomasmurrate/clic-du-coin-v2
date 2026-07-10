import { defineConfig, globalIgnores } from "eslint/config";
import nextVitals from "eslint-config-next/core-web-vitals";
import nextTs from "eslint-config-next/typescript";

export default defineConfig([
  globalIgnores([
    ".next/**",
    "out/**",
    "build/**",
    "coverage/**",
    "node_modules/**",

    ".claude/**",
    ".codex/**",
    "design-system/**",
    "supabase/**",
    "scripts/**",

    "next-env.d.ts"
  ]),

  nextVitals,
  nextTs
]);