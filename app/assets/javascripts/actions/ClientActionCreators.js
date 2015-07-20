var Marty = require('marty');
var ClientActions = require('../constants/Constants').ClientActions;
var ClientApi = require('../sources/ClientApi');

var ClientActionCreators = Marty.createActionCreators({
  loadClients(){
    this.app.ClientApi.getClients();
  },
  updateClient(id, data){
    ClientApi.updateClient(id, data);
  }
});

module.exports = ClientActionCreators;
