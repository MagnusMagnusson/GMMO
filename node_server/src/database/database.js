import fetch from "node-fetch";

export const USE_PROD = process.env.USE_PROD_DATABASE || false;
const DATABASE_DOMAIN = USE_PROD ? "http://db.arenabuildersonline.com" : "http://localhost";
const DATABASE_PORT = USE_PROD ? "" : ":5000";
const DATABASE_ADDRESS = DATABASE_DOMAIN + DATABASE_PORT;


export const Login = async (username, password) => {
    return fetch(DATABASE_ADDRESS+"/api/auth/login", {
        method: "POST",
        body: JSON.stringify({
            username,
            password
        })
    }).then((data) => {
        if(data.status < 400){
            return data.json();
        } else {
            console.log(data);
            return {
                success : false,
                reason : "Unknown error"
            }
        }
    });
}

export const NewUser = async (username, password, character) => {
    return fetch(DATABASE_ADDRESS+"/api/auth/create", {
        method: "POST",
        body: JSON.stringify({
            username,
            password,
            character
        })
    }).then((data) => {
        return data.json();
    });
}

const loadGameData = (url, type) => async (socket) => {
    return fetch(DATABASE_ADDRESS+url, {
        method: "GET",
    }).then((_d) => {
        _d.json().then(data => {
            socket.emit('gamedata',{
                type:type,
                data:data.results
            })
        });
    });
}

export const Gamedata = {
    Items :  loadGameData("/api/gamedata/items","items"),    
    Skills : loadGameData("/api/gamedata/skills","skills"),   
    Entities : loadGameData("/api/entity/entities","entities"),   
    Dungeons : loadGameData("/api/dungeon/dungeons","dungeons"),
}

export default {
    Login, NewUser, USE_PROD, Gamedata
}