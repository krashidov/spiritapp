var Marty = require('marty');
var ServerActions = require('../constants/Constants').ServerActions;

var ServerActionCreators = Marty.createActionCreators({
  loadClients: ServerActions.LOAD_CLIENTS(function () {
    this.dispatch();
  })
});

module.exports = ServerActionCreators;
