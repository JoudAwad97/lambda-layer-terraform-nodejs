import axios from "axios";
import pg from "pg";

export async function handler(_event) {
  console.log("function-1 handler running...");

  // we just imported pg package, we do not want to have a complicated setup
  // if the pg package does not exists, then the function will throw an error
  console.log("Simulating a database connection...");

  const response = await axios.get(
    "https://jsonplaceholder.typicode.com/todos/1"
  );

  console.log("function-1 handler finished...");
  return {
    statusCode: 200,
    body: JSON.stringify(response.data),
  };
}
