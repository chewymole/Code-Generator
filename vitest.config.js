import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import path from "path";

export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: [
      {
        find: "@/Editor.vue",
        replacement: path.resolve(__dirname, "./src/components/Editor.vue"),
      },
      {
        find: "@/EnhancedTableSelector.vue",
        replacement: path.resolve(
          __dirname,
          "./src/components/EnhancedTableSelector.vue"
        ),
      },
      {
        find: "@/Generate.vue",
        replacement: path.resolve(__dirname, "./src/components/Generate.vue"),
      },
      {
        find: "@/StartOptions.vue",
        replacement: path.resolve(__dirname, "./src/components/StartOptions.vue"),
      },
      {
        find: "@/TableSelector.vue",
        replacement: path.resolve(__dirname, "./src/components/TableSelector.vue"),
      },
      {
        find: "@/ViewCode.vue",
        replacement: path.resolve(__dirname, "./src/components/ViewCode.vue"),
      },
      {
        find: "@",
        replacement: path.resolve(__dirname, "./src"),
      },
      {
        find: "@src",
        replacement: path.resolve(__dirname, "./src"),
      },
      {
        find: "@config",
        replacement: path.resolve(__dirname, "./config"),
      },
    ],
  },
  test: {
    globals: true,
    environment: "jsdom",
    setupFiles: ["./tests/setup.js"],
  },
});
