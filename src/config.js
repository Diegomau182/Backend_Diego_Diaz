import {config} from "dotenv"

config()

export default{
    server: process.env.SERVER || " ",
    database: process.env.DATABASE || " ",
    user: process.env.USER || " ",
    password: process.env.PASSWORD || " ",
    port: process.env.PORT || " ",
 
}