import './App.css';
import {BrowserRouter, Route, Routes} from "react-router-dom";
import List from './view/list';

import React from "react";


function App() {

  return (
          <BrowserRouter>
              <Routes>
                  <Route path={"/"} element={<List />}></Route>
              </Routes>
          </BrowserRouter>
  );

}

export default App;
