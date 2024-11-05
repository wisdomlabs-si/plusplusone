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
      include: ['react', 'react-dom'],
    },
    resolve: {
      alias: {
      },
    },
    build: {
      chunkSizeWarningLimit: 1500,
      rollupOptions: {
        output: {
          manualChunks: (id) => {
            // React core dependencies
            if (id.includes('node_modules/react/') || 
                id.includes('node_modules/react-dom/')) {
              return 'react-vendor';
            }
            
            // UI library dependencies (adjust based on what you're using)
            if (id.includes('node_modules/@mui/') || 
                id.includes('node_modules/@emotion/') ||
                id.includes('node_modules/antd/')) {
              return 'ui-vendor';
            }

            // Data visualization or graph libraries
            if (id.includes('node_modules/@antv/') || 
                id.includes('node_modules/d3/')) {
              return 'graph-vendor';
            }

            // Utils and other common libraries
            if (id.includes('node_modules/lodash/') ||
                id.includes('node_modules/moment/') ||
                id.includes('node_modules/axios/')) {
              return 'utils-vendor';
            }
          }
        }
      },
    },
  });
};
