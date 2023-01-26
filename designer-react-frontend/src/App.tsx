import React from "react";
import "./style/scss/main.scss";
import Main from "./pages/main";
import { StoreProvider } from "./store";

function App(): JSX.Element {
  return (
    <div className="App">
      <StoreProvider>
        <Main />
      </StoreProvider>
    </div>
  );
}

export default App;
