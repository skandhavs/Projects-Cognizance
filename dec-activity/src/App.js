import './App.css';
import {BrowserRouter as Router,Route,Routes,Link} from "react-router-dom";
import Mountains from './Mountains';
import Rivers from './Rivers';
import Home from './Home';

function App() {
  return (
    
    <div className="App">
        <div className='Header'>
          <h1> Mountains and Rivers </h1>
        </div>
        <Router>
        <nav>
            <Link to = "/">Home</Link>          
            <Link to = "/mountains">Mountains</Link>
            <Link to = "/rivers">Rivers</Link>
        </nav>
        <Routes>
          <Route path='/' element={<Home/>}/>
          <Route path="/mountains" element={<Mountains/>}/>
          <Route path="/rivers" element={<Rivers/>}/>
        </Routes>

        </Router>
        
        
    </div>

  );
}

export default App;
