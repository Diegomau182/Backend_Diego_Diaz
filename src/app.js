import express from 'express'
import morgan from 'morgan'
import cors from 'cors'


//Importaciones de los enrutamientos
import routerPerson from './routes/person.router'

const app = express()
const corsOptions = {
    origin: ['http://localhost:3000'],
    credentials: true
}
//Configuraciones
app.set('port', 9000)

//middlewares
app.use(morgan("dev"))
app.use(cors(corsOptions))
app.use(express.json())

//Enrutaminetos
app.use(routerPerson)

export default app