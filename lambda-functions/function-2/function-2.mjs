import axios from "axios";
import pg from "pg";

export async function handler(_event) {
  console.log("function-2 handler running...");

  // The "pg" package has been imported. This setup is minimal and does not establish a connection to an actual database.
  // If the "pg" package is not available, the function will throw an error.
  console.log("Simulating a database connection...");

  const response = await axios.get(
    "https://jsonplaceholder.typicode.com/todos/1"
  );

  console.log("function-2 handler finished...");
  return {
    statusCode: 200,
    body: JSON.stringify(response.data),
  };
}
