var Marty = require('marty');
var Constants = require('../constants/Constants');
var _ = require('lodash');

var ClientStore = Marty.createStore({
  name: 'Clients',
  handlers: {
    setClients: Constants.ClientActions.ADD_CLIENTS
  },
  setClients: function (clients) {
    clients = _.map(clients, function(client) { 
      return _.pick(client, 
        ['first_name',
        'last_name',
        'address', 
        'city',
        'postal_code',
        'state',
        'hours_plus_travel', 
        'date_of_birth']);
    });
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