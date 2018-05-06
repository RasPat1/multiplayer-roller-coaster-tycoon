import React, { Component } from 'react';
import './App.css';
import Board from './components/Board/Board'
import Hud from './components/Hud/Hud'
import WithMouseCoordinates from './components/WithMouseCoordinates'

export const MousePositionContext = React.createContext({})

export const SelectedItemContext = React.createContext({})

class MouseTrackerComponent extends Component {

  render() {
    const { x:left, y:top } = this.props
    return (
      <div style={{left: left + 10, top: top + 10, position: 'absolute'}}>
        {this.props.render()}
      </div>
    )
  }
}

class App extends Component {
  state = { mouseTracker: null, selectedHudItem: null }

  setMouseTrailerComponent(component) {
    this.setState({
      mouseTracker: component,
      selectedHudItem: 'kiosk'
    })
  }

  render() {
    return (
      <WithMouseCoordinates
        render={(x, y) =>
          <MousePositionContext.Provider
            value={{
              coordinates: { x, y },
              setMouseTrailerComponent: component =>
                this.setMouseTrailerComponent(component)
            }}
          >
            <SelectedItemContext.Provider value={this.state.selectedHudItem}>
              <div className="App">
                <header className="App-header">
                  <h1 className="App-title">Roller Coaster Tycoon</h1>
                </header>
                <p className="App-intro">
                  Hey its a game.
                </p>
                {this.state.mouseTracker &&
                  <MouseTrackerComponent
                    x={x}
                    y={y}
                    render={() => this.state.mouseTracker} />
                }
                <Board />
                <Hud />
              </div>
            </SelectedItemContext.Provider>
          </MousePositionContext.Provider>
        }
      />
    );
  }
}

export default App;
