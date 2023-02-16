import { defineConfig } from "vite";
import reactRefresh from "@vitejs/plugin-react-refresh";

// https://vitejs.dev/config/
export default () => {
  return defineConfig({
    plugins: [reactRefresh()],
    server: {
      proxy: {
      },
    },
    optimizeDeps: {
    },
    resolve: {
      alias: {
      },
    },
    build: {
      rollupOptions: {
      },
    },
  });
};
