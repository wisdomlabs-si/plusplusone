import { defineConfig } from "vite";
import reactRefresh from "@vitejs/plugin-react-refresh";

// https://vitejs.dev/config/
export default () => {
  return defineConfig({
    plugins: [reactRefresh()],
    server: {
      proxy: {
        // "/view-models": {
        //   target: "http://localhost:8080",
        //   changeOrigin: true,
        //   autoRewrite: true,
        //   timeout: 1000,
        //   proxyTimeout: 1000,
        //   //rewrite: (path) => path.replace(/^\//, "/"),
        // },
        // "/action-executions": {
        //   target: "http://localhost:8080",
        //   changeOrigin: true,
        //   autoRewrite: true,
        //   timeout: 1000,
        //   proxyTimeout: 1000,
        // }
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
