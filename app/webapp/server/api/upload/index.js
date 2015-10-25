'use strict';

var express = require('express');
var controller = require('./upload.controller');
var multer = require('multer');
var upload = multer({dest:'/tmp/uploads/'});

var router = express.Router();

router.post('', upload.single('file'), controller.upload);

module.exports = router;
