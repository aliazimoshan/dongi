// Perform all your imports
const sdk = require("node-appwrite");

require("dotenv").config();

// Initialise the client SDK
let client = new sdk.Client();
client
  .setEndpoint(process.env.APPWRITE_END_POINT)
  .setProject(process.env.APPWRITE_PROJECT_ID)
  .setKey(process.env.APPWRITE_GROUP_DETAIL_ID);

// Initialise the storage SDK
let storage = new sdk.Storage(client);
let promise = storage.listFiles();

promise.then(
  function (response) {
    console.log(response);
  },
  function (error) {
    console.log(error);
  }
);
