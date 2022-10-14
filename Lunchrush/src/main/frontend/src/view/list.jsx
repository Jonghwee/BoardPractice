import React, {useState, useEffect} from "react";
import {NavLink} from "react-router-dom";
import axios from 'axios';

const List = () => {

    let [posts, setPosts] = useState([]);
    const [loading, setLoading] = useState(false);
    const [currentPage, setCurrentPage] = useState(1);
    const [postsPerPage, setPostsPerPage] = useState(5);

    useEffect(() => {
        console.log("첫번째 this = " + this)
        const fetchData = async () => {
            setLoading(true);
            const response = await axios.get(
                "http://localhost:8888/list"
            );
            setPosts(response.data);
            setLoading(false);
            console.log("두번째 this = " + this)

        };
        fetchData();
    }, []); //[] 속 변수나 값이 변경되었을 때 useEffect 재실행 ( 비워두지 않는 것이 좋다 )
    console.log("세번째 this = " + this)

    const indexOfLast = currentPage * postsPerPage;
    const indexOfFirst = indexOfLast - postsPerPage;
    const currentPosts = (posts) => {
        let currentPosts = 0;
        currentPosts = posts.slice(indexOfFirst, indexOfLast);
        return currentPosts;
    };
    const totalPosts = posts.length;
    posts = currentPosts(posts);

    const pageNumbers = [];
    for (let i = 1; i <= Math.ceil(totalPosts / postsPerPage); i++) {
        pageNumbers.push(i);
    }

    return (
        <>
            <h3>🍕Lunchrush🍕</h3>
            {loading && <div> loading... </div>}
            <div className={"container-md"}>
                <NavLink to={"/write"}>
                    <button type={"button"} className={"writeBtn btn btn-light"}>글쓰기</button>
                </NavLink>
                <table className={"table"}>
                    <thead>
                    <tr className={"table-light"}>
                        <th scope={"col"}>번호</th>
                        <th scope={"col"}>식당 이름</th>
                        <th scope={"col"}>점수</th>
                        <th scope={"col"}>당번</th>
                        <th scope={"col"}>날짜</th>
                    </tr>
                    </thead>
                    {posts != ""
                        ?
                        <tbody>
                        {posts.map((lunch) => (
                            <tr key={lunch.boardNo}>
                                <td>{lunch.boardNo}</td>
                                <td>{lunch.placeName}</td>
                                <td>{lunch.score}</td>
                                <td>{lunch.lunchLeader}</td>
                                <td>{lunch.date}</td>
                            </tr>
                        ))}
                        </tbody>
                        : <tbody><tr align={"center"}><td colSpan={5}>게시물이 없어요😢</td></tr></tbody>
                    }
                </table>
            </div>
            <div className={"btnGroup"}>
                <nav>
                    <div className="pagination PageUl">
                        {pageNumbers.map((number) => (
                            <div key={number} className="page-item PageLi">
                                <span onClick={() => setCurrentPage(number)} className="page-link PageSpan">
                                    {number}
                                </span>
                            </div>
                        ))}
                    </div>
                </nav>
            </div>
        </>

    )
}



export default List;
