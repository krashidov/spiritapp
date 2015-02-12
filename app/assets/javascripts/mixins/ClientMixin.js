var Marty = require('marty');
var ClientStore = require('../stores/ClientStore');

var ClientState = Marty.createStateMixin({
  listenTo: ClientStore,
  getState: function () {
    return {
      clients: ClientStore.getClients()
    };
  }
});

module.exports = ClientState;