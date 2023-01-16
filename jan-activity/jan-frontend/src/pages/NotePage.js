import React,{useState,useEffect} from 'react'
import {useParams,useNavigate} from 'react-router-dom'
import './NotePage.css'
import { ReactComponent as Left } from '../components/left.svg'
import { ReactComponent as Delete } from './delete.svg'
import { ReactComponent as AddNote } from './addnote.svg'
const NotePage = () => {
  let createNote = async()=>{
    fetch(`/api/notes/`,{
      method:"POST",
      headers:{
        'Content-Type':'application/json'
      },
      body:JSON.stringify(note)
    })
   
  }
  
  let updateNote = async()=>{
    fetch(`/api/notes/${noteID}/`,{
      method:"PUT",
      headers:{
        'Content-Type':'application/json'
      },
      body:JSON.stringify(note)
      
    },
    
     )
  }
  let deleteNote =async()=>{
    fetch(`/api/notes/${noteID}/`,
    {
      method:"DELETE",
      headers:{
        'Content-Type':'application/json'
      }
    }
    )
    navigate('/')

  }
  

    let noteID = useParams().id
    const navigate=useNavigate()
    
    let [note,setNote] = useState(null) 
    useEffect(()=>{
      let getNote = async ()=> {
        if(noteID==="new") return
        let response = await fetch(`/api/notes/${noteID}/`)
        let data =await response.json()
        setNote(data)
    }
        getNote()
    },[noteID])
    
    let handleSubmit =()=>{
      if(noteID!=="new" &&!note.body)
      {
        deleteNote()
      }
      else if(noteID!=="new")
      {
        updateNote()
      }
      else if(noteID==="new" &&note.body!==null)
      {
        createNote()
      }
      navigate('/')
    }
    
    
  return (
    
    
    <div className='note-container'>
      <div className='icon-container'>

          <Left onClick={handleSubmit}/>
          
          <span className='del-container'>
          {noteID!=="new"?(
            <Delete onClick={deleteNote} />
          ):(<AddNote onClick={handleSubmit}/>)}
          </span>
          

    </div>
      <textarea onChange= {(e)=>{setNote({...note,'body' : e.target.value})}} value={note?.body}></textarea>
    </div>
        
  )
}

export default NotePage