import React, { Component } from 'react';
import './App.css';
import Board from './components/Board/Board'
import Hud from './components/Hud/Hud'
import WithMouseCoordinates from './components/WithMouseCoordinates'

export const MousePositionContext = React.createContext({})

class App extends Component {
  render() {
    return (
      <WithMouseCoordinates
        render={(x, y) =>
          <MousePositionContext.Provider coordinates={{x, y}}>
            <div className="App">
              <header className="App-header">
                <h1 className="App-title">Roller Coaster Tycoon</h1>
              </header>
              <p className="App-intro">
                Hey its a game.
              </p>
              <Board />
              <Hud />
            </div>
          </MousePositionContext.Provider>
        }
      />
    );
  }
}

export default App;
