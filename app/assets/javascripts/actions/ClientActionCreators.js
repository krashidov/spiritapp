var Marty = require('marty');
var ClientActions = require('../constants/Constants').ClientActions;
var ClientApi = require('../sources/ClientApi');

var ClientActionCreators = Marty.createActionCreators({
  loadClients: ClientActions.LOAD_CLIENTS(function () {
    ClientApi.getClients();
  })
});

module.exports = ClientActionCreators;
