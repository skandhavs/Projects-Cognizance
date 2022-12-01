import React from 'react'
import "./Cards.css"

function Cards(props) {
  return (
        <div class="card">
            <img src={props.items.image} />
            <div class="container">
                <h2><b>{props.items.name}</b></h2>
                <p>{props.items.content}</p>
            </div>
        </div>
  )
}

export default Cards