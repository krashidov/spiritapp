var Marty = require('marty');
var ClientSourceActionCreators = require('../actions/ClientSourceActionCreators');
var Constants =  require('../constants/Constants').CLientActions;

var ClientApi = Marty.createStateSource({
  type: 'http',
  getClients: function () {
    this.get({ url: '/api/clients'}).then((res) => {
      this.app.ClientSourceActionCreators.addClients(res.body);
    },
    function(error){
      console.log(error);
    });
  },
  getClient: function (id) {
    return this.get({ url: '/api/clients/' + id})
    .then(res => this.app.ClientSourceActionCreators.addClient(res.body));
  }
});

module.exports = ClientApi;