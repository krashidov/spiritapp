var Marty = require('marty');
var Constants = require('../constants/Constants');
var ClientStore = Marty.createStore({
  name: 'Clients',
  handlers: {
    loadClients: Constants.ServerActions.LOAD_CLIENTS
  },
  loadClients: function () {
    debugger;
  },
  getInitialState: function () {
    return [];
  }
});

module.exports = ClientStore;