import React, { Component } from 'react'
import './Hud.css'
import Add from './Add'
import { KIOSK } from '../../constants/ItemConstants'

class Hud extends Component {
  state = {
    selected: null
  }

  onClick() {
    this.setState({
      selected: KIOSK
    })
  }

  render() {
    return (
      <div className='Hud'>
        <Add onClick={e => this.onClick(e)}/>
      </div>
    )

  }
}

export default Hud
