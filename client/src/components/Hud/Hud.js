import React, { Component } from 'react'
import './Hud.css'
import Add from './Add'
import { KIOSK } from '../../constants/ItemConstants'
import { MousePositionContext } from '../../App.js'

class Hud extends Component {
  state = { selected: null }

  render() {
    return (
      <div className='Hud'>
        <MousePositionContext.Consumer>
          {({coordinates, setMouseTrailerComponent}) =>
            <Add onClick={e => setMouseTrailerComponent(<Add />)}/>
          }
        </MousePositionContext.Consumer>
      </div>
    )

  }
}

export default Hud
