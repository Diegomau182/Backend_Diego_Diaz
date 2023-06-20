import sql from 'mssql';
import config from '../config';

const dbConfig = {
  user: config.user,
  password: config.password,
  database: config.database,
  server: config.server,
  port: parseInt(config.port),
  pool: {
    max: 10,
    min: 0,
    idleTimeoutMillis: 30000
  },
  options: {
    encrypt: true, // for azure
    trustServerCertificate: true // change to true for local dev / self-signed certs
  }
};

const pool = new sql.ConnectionPool(dbConfig);
const getConnection = async () => {
  try {
    await pool.connect();
    return pool;
  } catch (error) {
    console.error('Error al establecer la conexión a la base de datos:', error);
    throw error; // Re-throw the error to be handled at a higher level
  }
};

export { sql, getConnection };