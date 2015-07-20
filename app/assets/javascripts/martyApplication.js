var Marty = require('marty');

var martyApplication = Marty.createApplication(function () {
  this.register('ClientStore', require('./stores/ClientStore'));
  this.register('ClientActionCreators', require('./actions/ClientActionCreators'));
  this.register('ClientSourceActionCreators', require('./actions/ClientSourceActionCreators'));
  this.register('ClientApi', require('./sources/ClientApi'));
  this.router = require('./router');
});

module.exports = martyApplication;