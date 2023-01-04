import express from 'express';
import os from 'os';

const app = express();
const PORT = 3000;

app.use(express.json())

app.get("/", (req, res) => {
    res.status(200).json({ "status": `Ok from ${os.hostname}` })
})

app.listen(PORT, () => {
    console.log(`Up and running at ${PORT}`)
})