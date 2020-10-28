-------------------procedure for new project----------------
--> create a workspace
--> create app.js(not mandatory)
-------------------Package.json-----------------------
--> npm init  : initialize package.json file
--> in package.json , Scripts : add new script as "start": "node app.js" - so that in terminal : npm start
    for any other script except "start" , use : npm run script-key Ex: npm run server

------------------------Debugger--------------------------------
Run-->start debugging-->nodejs
-->Break point any line, while executing code stops running at breakpoint
-->Automatic debug: Run --> Add configuration -->nodejs : this will create a vscode folder and file "launch.json"
add below to launch.json (nodemon to be global)
            "restart":true,
            "runtimeExecutable": "nodemon",
            "console": "integratedTerminal",
restart app.js

------------------core modules-------------
------path-----------
const path = require('path');
res.sendFile(path.join(__dirname,'../','views','shop.html'));

------http-----------
const http = required('http');
const server = http.createServer(app); or (req,res) =>{}
server.listen(8000); 

------------------3rd party Packages--------------------
------nodemon-----------
-->Terminal: npm install --save-dev nodemon  ->limited to the project (dev dependancy in package.json)
-->Terminal: npm install -g nodemon  ->global
   (npm install) this will update all the modules  --will install node_modules folder
-->change in Scripts: instead of "node app.js"  to "nodemon app.js"

-------kill-port --------
-->Terinal: npm install kill-port --save-dev
-->creata a nodemon.json in root folder and add below 
    {
    "events": {
        "restart": "kill-port 8080",
        "crash": "kill-port 8080"
    },
    "delay": "1500"
    }

this will solve port already used when nodemon auto restarts

--------body-parser------------
Terminal: npm install --save body-parser
Usage: app.use(bodyParser.urlencoded({extended: true}));  --at the Top so all request parameter will be parsed and saved as object



---------Express.js--------
npm install --save express  (production dependancies in package.json)

How Express works: request -->multiple middleware --> response
app.use("path",req,res,next) -->both for Get & Post
app.get("path",res,next) --> only get
app.post("/",res,next)  --> only post


req.body --> get body of the request

res.send()    -->send response

const router = express.Router();  
router.use("path",req,res,next)
app.use('/user',shopRoutes);  --> this makes sure if only /user (filter)

app.use(express.static(path.join(__dirname,"public"))); --->css