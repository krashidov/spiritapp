var Marty = require('marty');
var ClientActions = require('../constants/Constants').ClientActions;
var ClientApi = require('../sources/ClientApi');

var ClientActionCreators = Marty.createActionCreators({
  loadClients: ClientActions.LOAD_CLIENTS( () => {
    ClientApi.getClients();
  }),
  updateClient: ClientActions.UPDATE_CLIENT( (id, data) => {
    ClientApi.updateClient(id, data);
  })
});

module.exports = ClientActionCreators;
