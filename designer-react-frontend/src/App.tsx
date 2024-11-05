import React, { Suspense } from "react";
import "./style/scss/main.scss";
import { StoreProvider } from "./store";

// Lazy load the Main component
const Main = React.lazy(() => import("./pages/main"));

function App(): JSX.Element {
  return (
    <div className="App">
      <StoreProvider>
        <Suspense fallback={<div className="loading">Loading...</div>}>
          <Main />
        </Suspense>
      </StoreProvider>
    </div>
  );
}

export default App;
