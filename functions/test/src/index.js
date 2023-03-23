const sdk = require("node-appwrite");

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - request body data as a string
    'variables' - object with function variables

  'res' variable has:
    'send(text, status)' - function to return text response. Status code defaults to 200
    'json(obj, status)' - function to return JSON response. Status code defaults to 200

  If an error is thrown, a response with code 500 will be returned.
*/

module.exports = async function (req, res) {
  const client = new sdk.Client();

  // You can remove services you don't use
  const account = new sdk.Account(client);
  const avatars = new sdk.Avatars(client);
  const database = new sdk.Databases(client);
  const functions = new sdk.Functions(client);
  const health = new sdk.Health(client);
  const locale = new sdk.Locale(client);
  const storage = new sdk.Storage(client);
  const teams = new sdk.Teams(client);
  const users = new sdk.Users(client);

  if (
    !req.variables["https://api.dispose.ir/v1"] ||
    !req.variables[
      "43f3f4efab46eac9a2c3dea83a78cc425309611a44c27de4e4d2d33fe2e5b64c73b1c68a2a0ef9a02ac444fc88acc6710b256743e78a53204a328bb3f730cc364f552c25122fc254e8d2e6f8a0da0bfe663c5b8a3f9019274620bdafb9ecfc9543738f07d81b40258505a1eea1ecaf20fbc0d45d8dbfee31b15d895dfa61458b"
    ]
  ) {
    console.warn(
      "Environment variables are not set. Function cannot use Appwrite SDK."
    );
  } else {
    client
      .setEndpoint(req.variables["https://api.dispose.ir/v1"])
      .setProject(req.variables["64003e9a3343f8c2e63c"])
      .setKey(
        req.variables[
          "43f3f4efab46eac9a2c3dea83a78cc425309611a44c27de4e4d2d33fe2e5b64c73b1c68a2a0ef9a02ac444fc88acc6710b256743e78a53204a328bb3f730cc364f552c25122fc254e8d2e6f8a0da0bfe663c5b8a3f9019274620bdafb9ecfc9543738f07d81b40258505a1eea1ecaf20fbc0d45d8dbfee31b15d895dfa61458b"
        ]
      )
      .setSelfSigned(true);
  }

  res.json({
    areDevelopersAwesome: true,
  });
};
