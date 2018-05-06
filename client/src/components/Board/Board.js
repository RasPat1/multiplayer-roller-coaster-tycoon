import React, { Component } from 'react'
import { SelectedItemContext } from '../../App.js'
import './Board.css'

const BOARDSIZE = 10

const gridStyle = {
  gridTemplateRows: `repeat(${BOARDSIZE}, 20px)`,
  gridTemplateColumns: `repeat(${BOARDSIZE}, 20px)`
}

const calculateCellColumn = pos => pos < BOARDSIZE ? pos : pos % BOARDSIZE

const calculateCellRow = pos => pos < BOARDSIZE ? 1 : (pos / BOARDSIZE) + 1

const populateCells = onClick => {
  return new Array(Math.pow(BOARDSIZE, 2)).fill().map((cell, index) => {
    const pos = index + 1

    const cellStyle = {
      gridColumn: calculateCellColumn(pos),
      gridRow: calculateCellRow
    }

    return (
      <div
        key={index}
        className='grid-cell'
        style={cellStyle}
        onClick={onClick}
      />
    )
  })
}

class Board extends Component {

  addItemToBoard() {

  }

  onCellClick(e, selected) {
    if (selected) this.addItemToBoard()
  }

  render() {
    return (
      <SelectedItemContext.Consumer>
        {selected =>
          <div className='Board'>
            <div className='grid-container' style={gridStyle}>
              {populateCells(e => this.onCellClick(e, selected))}
            </div>
          </div>
        }
      </SelectedItemContext.Consumer>
    )
  }
}

export default Board
