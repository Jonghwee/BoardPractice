import React, {useEffect, useState} from "react";
import axios from 'axios';

function List(){
    const [list, setList] = useState('')

    useEffect(() => {
        axios.get('/list')
            .then(response => setList(response.data))
            .catch(error => console.log(error))
    }, []);

    return(
        <div>
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
                {list != ''
                    ?
                    <tbody>
                    { list && list.map(lunch => (
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
    )
}
export default List;