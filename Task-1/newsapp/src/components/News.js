import React, { useContext } from "react";
import { NewsContext } from "../newsContext";
import News_article from "./newsarticle";

function News(props) {
    const { data } = useContext(NewsContext);
    console.log(data);
    return (
        <div id="container" class="none">
        <h1 className="head__text"><u> Your Latest News</u></h1>
        
        <div className="all__news">
            {data
            ? data.articles.map((news) => (
                <News_article data={news} key={news.url} />
                ))
            : "Loading"}
        </div>
        </div>
        
    );
}
export default News;