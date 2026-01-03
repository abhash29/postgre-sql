//write a function to create a users table in your db
import {Client} from "pg";

const client = new Client({
   connectionString : 'postgresql://neondb_owner:npg_RyfWg3snIB1w@ep-bitter-field-ahyale44-pooler.c-3.us-east-1.aws.neon.tech/neondb?sslmode=require&channel_binding=require'
})


/*async function createUserTable(){
    await client.connect();
    const result = await client.query(`
        CREATE TABLE   users(
            id SERIAL PRIMARY KEY,
            username VARCHAR(50) UNIQUE NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL,
            password VARCHAR(255) NOT NULL,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP 
        );
        `)
    console.log(result);
}

createUserTable();


//async function to insert data
async function insertData(){
    await client.connect();
    const insertQuery = "INSERT INTO USERS (username, email, password) VALUES ('username2', 'abhash@gmail', 'Abhash@1234')";
    const res = await client.query(insertQuery);
    console.log("Inserstion success", res);
}
insertData();*/


//async function to get all the users
async function getUser(){
    await client.connect();
    const query = 'SELECT * FROM users';
    const result = await client.query(query, []);
    console.log(result);
}
getUser();
