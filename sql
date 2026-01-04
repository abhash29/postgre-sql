//Connection string
//Schema
import {Client} from 'pg';

const client = new Client({
    connectionString: 'postgresql://neondb_owner:npg_gYrqOZa0uUt6@ep-calm-term-a4eqq827-pooler.us-east-1.aws.neon.tech/neondb?sslmode=require&channel_binding=require'
})
await client.connect();

//create the user table
async function createUserTable(){
        const result = await client.query( `
            CREATE TABLE IF NOT EXISTS users (
                id SERIAL PRIMARY KEY,
                username VARCHAR(100) UNIQUE NOT NULL,
                email VARCHAR(100) UNIQUE NOT NULL,
                password VARCHAR(150) NOT NULL,
                created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
            );
        `)
        console.log("User table created");
}


//create the todo table
async function createTodoTable(){
    const result = await client.query(`
      CREATE TABLE IF NOT EXISTS todo(
        id SERIAL PRIMARY KEY,
        user_id INTEGER,
        work VARCHAR(250) NOT NULL,
        time VARCHAR(250) NOT NULL,
        status BOOLEAN DEFAULT FALSE,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id)
      );
        `)
    console.log("Todo table created");
}

//await createUserTable();
//await createTodoTable();


//insert data
async function insertUserData(username: string, email: string, password: string){
    const insertQuery = "INSERT INTO users (username, email, password) VALUES ($1, $2, $3)";
    const values = [username, email, password];
    const res = await client.query(insertQuery, values);
    console.log("Insertion successful");
}

async function insertTodaData(user_id: Number, work: string, time: string, status: boolean){
    const insertQuery = "INSERT INTO todo (user_id, work, time, status) VALUES ($1, $2, $3, $4)";
    const res = await client.query(insertQuery)
    console.log("Todo added");
}
insertUserData("pranjal2", "pranjal@gmail.com", "123");
