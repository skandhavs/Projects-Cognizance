import React from 'react'
import Cards from './Cards'
import nile from './images/nile.jpg'
import amazon from './images/amazon.jpg'
import yangtze from './images/yangtze.jpg'
import yellowriver from './images/yellow river.jpg'
import parana from './images/parana.jpeg'
import congo from './images/congo.jpg'

function Rivers() {
    const data= [
        {
            image:nile,
            name:'Nile',
            content:'1st Longest'
        },
        {
            image:amazon,
            name:'Amazon River',
            content:'2nd Longest'
        },
        {
            image:yangtze,
            name:'Yangtze River',
            content:'3rd Longest'
        },
        {
            image:yellowriver,
            name:'Yellow RIver',
            content:'4th Longest'
        },
        {
            image:parana,
            name:'Parana River',
            content:'5th Longest'
        },
        {
            image:congo,
            name:'Congo River',
            content:'6th Longest'
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


export default Rivers