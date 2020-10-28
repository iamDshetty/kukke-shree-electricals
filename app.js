//Core modules
//const http = require('http');
const path = require('path');

//3rd party modules
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

//local modules
const adminRoutes = require('./routes/admin');
const shopRoutes = require('./routes/shop');

//server routes handler
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(path.join(__dirname,"public")));
app.use('/admin',adminRoutes);
app.use('/user',shopRoutes);

app.use((req,res,next) => {
res.status(404).sendFile(path.join(__dirname,'views','404.html'));
});

//server 
app.listen(8080); 


