import React, { Component } from 'react';
import './App.css';
import Board from './components/Board/Board'

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <h1 className="App-title">Roller Coaster Tycoon</h1>
        </header>
        <p className="App-intro">
          Hey its a game.
        </p>
        <Board />
      </div>
    );
  }
}

export default App;
