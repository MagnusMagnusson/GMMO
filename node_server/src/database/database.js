import fetch from "node-fetch";

const USE_PROD = process.env.USE_PROD_DATABASE || false;
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

export default {
    Login, NewUser
}