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

export const Gamedata = {
    Items : async (socket) => {
        return fetch(DATABASE_ADDRESS+"/api/gamedata/items", {
            method: "GET",
        }).then((_d) => {
            _d.json(),then(data => {
                socket.emit('gamedata',{
                    type:'items',
                    data:data.results
                })
            });
        });
    },    
    Skills : async (socket) => {
        return fetch(DATABASE_ADDRESS+"/api/gamedata/skills", {
            method: "GET",
        }).then((_d) => {
            _d.json(),then(data => {
                socket.emit('gamedata',{
                    type:'skills',
                    data:data.results
                })
            });
        });
    },
    Entities : async (socket) => {
        return fetch(DATABASE_ADDRESS+"/api/entity/entities", {
            method: "GET",
        }).then((_d) => {
            _d.json(),then(data => {
                socket.emit('gamedata',{
                    type:'entities',
                    data:data.results
                })
            });
        });
    },
    Dungeons : async (socket) => {
        return fetch(DATABASE_ADDRESS+"/api/dungeon/dungeons", {
            method: "GET",
        }).then((_d) => {
            _d.json(),then(data => {
                socket.emit('gamedata',{
                    type:'dungeons',
                    data:data.results
                })
            });
        });
    },
}

export default {
    Login, NewUser, USE_PROD, Gamedata
}