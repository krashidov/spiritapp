var Marty = require('marty');

var ClientApi = require('../sources/ClientApi');
var Constants = require('../constants/Constants');
var _ = require('lodash');

var ClientStore = Marty.createStore({
  id: 'clientStore',

  handlers: {
    setClients: Constants.ClientActions.ADD_CLIENTS,
    addClient: Constants.ClientActions.ADD_CLIENT
  },
  setClients (response) {
    this.state = response.clients;
    this.hasChanged();
  },

  addClient(response){
    this.state.push(response.client);
    this.hasChanged();
  },

  getClients(){
    return this.state;
  },
  
  getInitialState () {
    return [];
  },

  getClient(id) {
    return this.fetch({
      id: id,
      locally() {
        return _.find(this.state, {id: Number(id)} );
      },
      remotely() {
        return this.app.ClientApi.getClient(id);
      }
    });
  } 
});

module.exports = ClientStore;