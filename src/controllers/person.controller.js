import {getConnection} from '../database/database'
import XlsxPopulate from 'xlsx-populate'
  //obtiene las personas de la base datos
  const getListPersons = async(req, res) => {
    try
    {
        const connection = await getConnection()
        const result = await connection.query("Select * from Persona") 
        res.json(result)
    }catch (error) {
        res.status(500)
        res.send(error.message)        
    }
}
//guarda la persona en la base de datos
const savePerson = async(req, res) => {
    try {
        const workbook = await XlsxPopulate.fromFileAsync('/path/to/excel/file.xlsx');
        const worksheet = workbook.sheet('Sheet1'); // Ajusta el nombre de la hoja según tu archivo Excel
    
        const rows = worksheet.usedRange().value();
        const data = rows.slice(1); // Ignora la primera fila si contiene encabezados
    
        const connection = await getConnection();
    
        for (const row of data) {
          const [dni, nombre, apellido, fechaNacimiento, telefono] = row;
          await connection.query('INSERT INTO Persona (DNI, Nombre, Apellido, FechaNacimiento, Telefono) VALUES (?, ?, ?, ?, ?)', [dni, nombre, apellido, fechaNacimiento, telefono]);
        }
    
        res.json({ message: 'Registros insertados correctamente' });
    } catch (error) {
    res.status(500).send(error.message);
    }
}
//Editar la persona en la base de datos apartir del id
const editPerson = async(req, res) => {
    try {
                const {id} = req.params
                const dni = req.body.dni
                const nombre = req.body.nombre
                const apellido = req.body.apellido
                const fechaNacimiento = req.body.fechaNacimiento
                const telefono = req.body.telefono
                const connection = await getConnection()
                const result = await connection.query("UPDATE Persona SET DNI=?, Nombre=?, Apellido=?, FechaNacimiento=?, Telefono=? WHERE Id=?;", [dni, nombre, apellido, fechaNacimiento, telefono, id])
                res.json(result)
        }
         catch (error) {
        res.status(500)
        res.send(error.message)      
    }
}
//Elimina la persona en la base de datos apartir del id
const deletePerson = async(req, res) => {
    try {
                const {id} = req.params
                const result = await connection.query("DELETE FROM Persona WHERE Id=?; ", id) 
                res.json(result)        
    
            } catch (error) {
        res.status(500)
        res.send(error.message)      
    }
}

export const methods = {
    getListPersons,
    savePerson,
    editPerson,
    deletePerson
}