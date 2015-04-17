var Marty = require('marty');
var ClientActions = require('../constants/Constants').ClientActions;

var ClientSourceActionCreators = Marty.createActionCreators({
  addClients(clients) {
    this.dispatch(ClientActions.ADD_CLIENTS, clients);
  },

  addClient(client){
    this.dispatch(ClientActions.ADD_CLIENT, client);
  }
});

module.exports = ClientSourceActionCreators;