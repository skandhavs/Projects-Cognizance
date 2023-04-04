import React,{useState,useEffect} from 'react'

import Note from '../components/Note'
import Addbutton from '../components/Add'
const Noteslist = () => {
    let [notes,setNotes]=useState([]) 
    useEffect(()=>{
      getNotes()
    },[])


    let getNotes = async ()=>{
        let response = await fetch ('/api/notes/')
        let data = await response.json()
        console.log('DATA:',data)
        setNotes(data)
    } 
  return (
    <div className='main_container'>
        <Addbutton/>
        {notes.map((note,index)=> (
          <Note key={index} note={note}/>
        ))}
    </div>
  )
}

export default Noteslist