const path = require('path');
const express = require('express');
const router = express.Router();  

const rootDir = require('../util/path');

router.use('/contact',(req,res,next)=>{
    res.sendFile(path.join(rootDir,"views","contact.html"));
    });

router.use('/product',(req,res,next)=>{
    console.log(req.body);
    res.redirect('/admin/contact');
});
router.use('/about',(req,res,next)=>{
   console.log(req.body);

});

module.exports = router;