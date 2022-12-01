import React from 'react'
import Cards from './Cards'
import everest from './images/everest.jpg'
import K2 from './images/K2.jpg'
import kamet from './images/kamet.jpg'
import kanchenjunga from './images/kangchenjunga.jpg'
import nandadevi from './images/nandadevi.jpg'
import nangaparbat from './images/nangaparbat.jpg'

function Mountains() {
    const data= [
        {
            image:everest,
            name:'Everest',
            content:'1st Tallest'
        },
        {
            image:K2,
            name:'K2',
            content:'2nd Tallest'
        },
        {
            image:kamet,
            name:'Kamet',
            content:'3rd Tallest'
        },
        {
            image:kanchenjunga,
            name:'Kanchenjunga',
            content:'4th Tallest'
        },
        {
            image:nandadevi,
            name:'Nanda Devi',
            content:'5th Tallest'
        },
        {
            image:nangaparbat,
            name:'Nanga Parbat',
            content:'6th Tallest'
        },
    ]
  return (
    <div className='main_container'>
        <Cards items={data[0]}/>
        <Cards items={data[1]}/>
        <Cards items={data[2]}/>
        <Cards items={data[3]}/>
        <Cards items={data[4]}/>
        <Cards items={data[5]}/>
    </div>
    
  )
}

export default Mountains