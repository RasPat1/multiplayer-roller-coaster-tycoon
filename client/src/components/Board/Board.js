import React, { Component } from 'react'
import './Board.css'

const BOARDSIZE = 10

const gridStyle = {
  gridTemplateRows: `repeat(${BOARDSIZE}, 20px)`,
  gridTemplateColumns: `repeat(${BOARDSIZE}, 20px)`,
}

const calculateCellColumn = pos => pos < BOARDSIZE ? pos : pos % BOARDSIZE

const calculateCellRow = pos => pos < BOARDSIZE ? 1 : (pos / BOARDSIZE) + 1

const populateCells = () => {
  return new Array(Math.pow(BOARDSIZE, 2)).fill().map((cell, index) => {
    const pos = index + 1

    const cellStyle = {
      gridColumn: calculateCellColumn(pos),
      gridRow: calculateCellRow
    }

    return <div key={index} className='grid-cell' style={cellStyle} />
  })
}

class Board extends Component {
  render() {
    return (
      <div className='Board'>
        <div className='grid-container' style={gridStyle}>
          {populateCells()}
        </div>
      </div>
    )
  }
}

export default Board
