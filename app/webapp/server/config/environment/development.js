'use strict';
var path = require('path');

// Development specific configuration
// ==================================
module.exports = {
  // MongoDB connection options
  mongo: {
    uri: 'mongodb://localhost/nodeapp-dev'
  },

  seedDB: true,

};
