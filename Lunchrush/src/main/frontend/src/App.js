import logo from './logo.svg';
import './App.css';
import {BrowserRouter, Link, Route, Routes} from "react-router-dom";
import List from './view/list';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<List />}/>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
