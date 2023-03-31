const { Client, Databases } = require("node-appwrite");
const dotenv = require("dotenv");

module.exports = async function (req, res) {
  console.log("FUNCTION CALLED!!!!!");

  //  Config Dotenv
  dotenv.config();

  const client = new Client()
    .setEndpoint(process.env.END_POINT)
    .setProject(process.env.PROJECT_ID)
    .setKey(process.env.API_KEY);

  //  try {
  const database = new Databases(client);
  let groupId = req.payload;
  console.log(groupId);
  const groupResponse = await database.getDocument(
    process.env.DATABASE_ID,
    process.env.GROUP_COLLECTION_ID,
    groupId
    //[Query.equal("creatorId", uid)]
  );

  console.log({ groupResponse });
  // Group with populated member
  let groupsWithMembers = groupResponse;
  for (let i = 0; i < groupResponse.members.length; i++) {
    const memberID = groupResponse.members[i];
    const userResponse = await database.getDocument(
      process.env.DATABASE_ID,
      process.env.USER_COLLECTION_ID,
      memberID
    );
    console.log(userResponse);
    if (userResponse) {
      groupsWithMembers.members[i] = userResponse;
    }
  }

  return res.json({ data: groupsWithMembers, message: "", status: 200 });
  //  } catch (error) {
  //    console.log(error);
  //    return res.json({
  //      message: error || "Something went wrong",
  //      status: 500,
  //      data: "",
  //    });
  //  }
};
