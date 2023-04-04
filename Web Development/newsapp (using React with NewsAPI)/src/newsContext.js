import React,{createContext, useEffect,useState} from "react";
import axios from "axios";
export const NewsContext=createContext();
export const NewsContextProvider=(props) =>{
    const [data, setData] = useState();
    const apiKey="892949219eb6409f99b9d6ae8ee49436";
    useEffect(() => {
        axios
          .get(`http://newsapi.org/v2/everything?q=rich&from=2022-05-21&sortBy=publishedAt&apiKey=${apiKey}`)
          .then((response) => setData(response.data))
          .catch((error) => console.log(error));
      }, []);
      return (<NewsContext.Provider value={{ data }}>{props.children}</NewsContext.Provider>);
    };

