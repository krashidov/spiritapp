var Marty = require('marty');
var ClientActions = require('../constants/Constants').ClientActions;

var ClientSourceActionCreators = Marty.createActionCreators({
  addClients: ClientActions.ADD_CLIENTS(function (clients) {
    this.dispatch(clients);
  })
});

module.exports = ClientSourceActionCreators;