import React, {useRef, useState} from "react";
import axios from "axios";
import Datepicker from "react-datepicker"
import "react-datepicker/dist/react-datepicker-cssmodules.css";
import "react-datepicker/dist/react-datepicker.css";
import {useNavigate} from "react-router-dom";

function Write(){

    const navigate = new useNavigate();


    const [date, setDate] = useState(new Date());
    const [place, setPlace] = useState("");
    const [leader, setLeader] = useState("");
    const [score, setScore] = useState("");
    const [address, setAddress] = useState("");
    const [content, setContent] = useState("");
    const [imgFile, setImgFile] = useState(null);
    const [imgBase64, setImgBase64] = useState([]);

    const changePlace = (event) => {
        setPlace(event.target.value);
    }

    const changeLeader = (event) => {
        setLeader(event.target.value);
    }

    const changeScore = (event) => {
        setScore(event.target.value);
    }

    const changeAddress = (event) => {
        setAddress(event.target.value);
    }

    const changeContent = (event) => {
        setContent(event.target.value);
    }

    const handleChangeFile = (event) => {
        console.log(event.target.file);
        setImgFile(event.target.files);
        setImgBase64([]);
        for(let i=0 ; i<event.target.file.length ; i++){
            if(event.target.file[i]){
                let reader = new FileReader();
                reader.readAsDataURL(event.target.file[i]);
                reader.onloadend = () => {
                    const base64  = reader.result;
                    console.log(base64);
                    if(base64){
                        let base64Sub = base64.toString();
                        setImgBase64(imgBase64 => [...imgBase64, base64Sub]);
                    }
                }

            }
        }

    }

    const writeBoard = async () => {

        const fd = new FormData();
        for(let i=0 ; i<imgFile.length ; i++){
            fd.append("file", imgFile[i]);
        }

        const lunchrush = {
            date : date,
            placeName : place,
            lunchLeader : leader,
            score : score,
            address : address,
            content : content,
        }


        await axios.post("http://localhost:8888/insert", lunchrush, {
            headers : {
                'Content-Type' : 'multipart/form-data'
            }
        })
            .then((response) => {
                console.log("insert ??????");
                console.log(response.data);

                alert("????????? ??????????????????!");
                navigate('/list');
            })
            .catch((error) => {
                console.log(lunchrush)
                console.log("????????????");
                console.log(error);
            })
    }

    return(
        <div className={"container-md"}>
            <div className={"mb-3 row"}>
                <label htmlFor={"date"} className={"col-sm-2 col-form-label"}>??????</label>
                <div className={"col-sm-10"}>
                    <Datepicker dateFormat={"yyyy-MM-dd"} selected={date} onChange={date => setDate(date)} name={"date"} autoComplete={"off"}/>
                </div>
            </div>
            <div className={"mb-3 row"}>
                <label htmlFor={"placeName"} className={"col-sm-2 col-form-label"}>?????? ??????</label>
                <div className={"col-sm-10"}>
                    <input type={"text"} id={"placeName"} className={"form-control"} name={"placeName"} onChange={changePlace} placeholder={"?????? ????????? ??????????????????"}/>
                </div>
            </div>
            <div className={"mb-3 row"}>
                <label htmlFor={"lunchLeader"} className={"col-sm-2 col-form-label"}>??????</label>
                <div className={"col-sm-10"}>
                    <input type={"text"} id={"lunchLeader"} className={"form-control"} name={"lunchLeader"} onChange={changeLeader} placeholder={"????????? ????????? ??????????????????"}/>
                </div>
            </div>
            <div className={"mb-3 row"}>
                <label htmlFor={"score"} className={"col-sm-2 col-form-label"}>??????</label>
                <div className={"col-sm-10"}>
                    <input type={"text"} id={"score"} className={"form-control"} name={"score"} onChange={changeScore} placeholder={"????????? ??????????????????"}/>
                </div>
            </div>
            <div className={"mb-3 row"}>
                <label htmlFor={"address"} className={"col-sm-2 col-form-label"}>?????? ??????</label>
                <div className={"col-sm-10"}>
                    <input type={"text"} id={"address"} className={"form-control"} name={"address"} onChange={changeAddress} placeholder={"?????? ????????? ??????????????????"}/>
                </div>
            </div>
            <div className={"mb-3 row"}>
                <label htmlFor={"content"} className={"col-sm-2 col-form-label"}>?????????</label>
                <div className={"col-sm-10"}>
                    <input type={"text"} id={"content"} className={"form-control"} name={"content"} onChange={changeContent} placeholder={"????????? ??????????????????"}/>
                </div>
            </div>
            <div className={"mb-3 row"}>
                <label htmlFor={"formFileSm"} className={"col-sm-2 col-form-label"}>?????? ??????</label>
                <div className={"col-sm-10"}>
                    <input type={"file"} id={"formFileSm"} className={"form-control"} onChange={handleChangeFile} name={"file"}/>
                </div>
            </div>

            <div>
                <button onClick={writeBoard}>????????????</button>
            </div>
        </div>
    )
}
export default Write;