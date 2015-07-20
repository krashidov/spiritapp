var React = require('react');
var Router = require('react-router');
var Route = Router.Route;

var Dashboard = require('./components/Dashboard.react.js');
var View = require('./components/View.react.js');
var ClientListView = require('./components/client/ClientListView.react.js');
var ClientEditContainer = require('./components/client/ClientEditContainer.react.js');


module.exports = [
  <Route name="dashboard" path="/dashboard" handler={Dashboard}/>,
  <Route name="view" path="/view" handler={View}/>,
  <Route name="clients" path="/clients" handler={ClientListView}/>,
  <Route name="client" path="/clients/:clientId" handler={ClientEditContainer}/>
];