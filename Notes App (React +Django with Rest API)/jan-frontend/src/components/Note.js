import React from 'react'
import {Link} from 'react-router-dom'
import './Note.css'

let getTime =(note)=>{
  return new Date(note.updated).toLocaleDateString()
}
let getTitle =(note)=>{
  let title =note.body.split("\n")[0]
  if(title.length >30){
    return title.slice(0,30)
  }
  return title
}
let getcontent =(note) => {
  let title = getTitle(note)
  let content = note.body.replaceAll('\n',' ')
  content=content.replaceAll(title,'')
  if(content.length >30){
    return content.slice(0,30) +"..."
  }
  else{
    return content
  }
}
const Note = ({note}) => {
  return (
    <div className="card">
      <Link to={`/note/${note.id}`}>
        <h3>{getTitle(note)}</h3>
        <div className='container'>
        <h4>{getTime(note)}</h4>
        <h5>{getcontent(note)}</h5>
        </div>
        </Link>  
    </div>
  )
}

export default Note