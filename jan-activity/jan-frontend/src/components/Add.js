import React from 'react'
import './Add.css'
import { ReactComponent as Addb } from './add.svg'
import { Link } from 'react-router-dom'
const Add = () => {
  return (
    <div className='card card-2'>
      <Link to="/note/new">
        <Addb></Addb>
        </Link>
    </div>
  )
}

export default Add