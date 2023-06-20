import {Router} from "express"
import	{ methods as personController} from "../controllers/person.controller"

const router = Router()

//metodos para personas
router.get("/api/v1/personas", personController.getListPersons)
router.post("/api/v1/personas",  personController.savePerson)
router.put("/api/v1/personas/:id",personController.editPerson)
router.delete("/api/v1/personas/:id",personController.deletePerson)

export default router