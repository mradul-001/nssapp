const mysql = require('mysql2');

const pool = mysql.createPool({
  host: "10.198.49.6",
  user: 'nss',
  password: 'nsswebmaxx@1920',
  database: 'nssapp',
});

// ------------ TESTING THE CONNECTION -------------

const testConnection = async () => {
  try {
    await pool.execute('SELECT 1');
    console.log('Database connection successful!');
  } catch (error) {
    console.error('Database connection failed:', error.message);
  }
};

testConnection();

// -------------------------------------------------

module.exports = pool.promise();