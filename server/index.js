const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send('Hello, world!');
});
app.post('/party', (req, res) => {
  const partyId = req.body.partyId;
  // TODO: Create a new party with the given ID
  res.send({ message: `Party ${partyId} created` });
});
app.post('/party/:partyId/nominate', (req, res) => {
  const songId = req.body.songId;
  // TODO: Nominate the song for the party
  res.send({ message: `Song ${songId} nominated` });
});
app.post('/party/:partyId/vote', (req, res) => {
  const songId = req.body.songId;
  // TODO: Cast a vote for the song
  res.send({ message: `Vote cast for song ${songId}` });
});
app.post('/party/:partyId/transfer', (req, res) => {
  const newOwnerId = req.body.newOwnerId;
  // TODO: Transfer ownership of the party to the new owner
  res.send({ message: `Ownership transferred to user ${newOwnerId}` });
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
