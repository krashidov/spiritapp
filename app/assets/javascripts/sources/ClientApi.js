var Marty = require('marty');
var ClientSourceActionCreators = require('../actions/ClientSourceActionCreators');
var ClientApi = Marty.createStateSource({
  type: 'http',
  getClients: function () {
    this.get({ url: '/api/clients'}).then(function (res) {
      ClientSourceActionCreators.addClients(res.body);
    },
    function(error){
      console.log(error);
    });
  }
});

module.exports = ClientApi;