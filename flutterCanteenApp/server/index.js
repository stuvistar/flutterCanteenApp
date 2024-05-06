const express = require('express');
//const serverless = require('serverless-http');
const mongoose = require('mongoose');

const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const settingsRouter = require('./routes/settings'); 
const feedbackRouter = require('./routes/feedback');
const hrrouter = require('./routes/hrreport');
const snacksRouter = require('./routes/snacks');
const countRouter = require('./routes/getcount');

const PORT = 3000;
const app = express();
const DB = 'mongodb+srv://canteenmanagementDBadmin:DataBase123456@canteenmanagmentcluster.mongocluster.cosmos.azure.com/?tls=true&authMechanism=SCRAM-SHA-256&retrywrites=false&maxIdleTimeMS=120000';
//const DB = "mongodb+srv://test123:test123@cluster0.ioejqkz.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(settingsRouter);
app.use(feedbackRouter);
app.use(hrrouter);
app.use(snacksRouter);
app.use(countRouter);

//app.use(/.netlify/server/index);


mongoose.connect(DB).then( () => {
    console.log('Connection Successful');
}).catch((e) => {
    console.log(e);
})

app.listen(PORT,'192.168.92.117', () => {
    console.log(`Connected at port ${PORT}`);
})

//module.exports.handler = serverless(app);

