import './App.css';
import Header from './components/Header'
import { HashRouter as Router,Route,Routes} from 'react-router-dom';
import Noteslist from './pages/Noteslist';
import NotePage from './pages/NotePage';
function App() {
  return (
    

    <div className="App">
      <Header/>
      <Router>
        <Routes>
        <Route path="/"  exact element={<Noteslist/>}/>
        <Route path="/note/:id"  element={<NotePage/>}/>
        </Routes>
        </Router>
    </div>

    
    
  );
}

export default App;
