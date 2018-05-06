import React, { Component } from 'react'

class WithMouseCoordinates extends Component {
  state = { x: null, y: null }

  onMouseMove(e) {
    this.setState({
      x: e.clientX,
      y: e.clientY
    })
  }

  render() {
    const { x, y } = this.state
    return(
      <div onMouseMove={e => this.onMouseMove(e)}>
        {this.props.render(x, y)}
      </div>
    )
  }
}

export default  WithMouseCoordinates
