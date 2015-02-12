var Marty = require('marty');
var Constants = require('../constants/Constants');
var _ = require('lodash');

var ClientStore = Marty.createStore({
  name: 'Clients',
  handlers: {
    setClients: Constants.ClientActions.ADD_CLIENTS
  },
  setClients: function (clients) {
    this.state =clients;
    this.hasChanged();
  },
  getClients: function(){
    return this.state;
  },

  
  getInitialState: function () {
    return {};
  }
});

module.exports = ClientStore;