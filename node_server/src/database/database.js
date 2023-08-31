const USE_PROD = process.env.USE_PROD_DATABASE || false;
const DATABASE_DOMAIN = USE_PROD ? "db.arenabuildersonline.com" : "127.0.0.1";
const DATABASE_PORT = USE_PROD ? "" : ":5000";
const DATABASE_ADDRESS = DATABASE_DOMAIN + DATABASE_PORT;


export const Login = async (username, password) => {
    return fetch(DATABASE_ADDRESS, {
        method: "POST",
        data: {
            username,
            password
        }
    })
}

export default {
    Login,
}