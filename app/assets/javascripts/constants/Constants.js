var Marty = require('marty');

var Constants = Marty.createConstants({
  ClientActions: ['LOAD_CLIENTS','ADD_CLIENTS', 'ADD_CLIENT', 'UPDATE_CLIENT', 'CLIENT_LOADED']
});

module.exports = Constants;