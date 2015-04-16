var React = require('react');
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;
var TopNavbar = require('./TopNavbar.react.js');
var Grid = require('react-bootstrap').Grid;
var Dashboard = require('./Dashboard.react.js')
var View = require('./View.react.js')
var ClientEdit = require('./client/ClientEdit.react.js')
var ClientListView = require('./client/ClientListView.react.js');

var App = React.createClass({

  mixins: [ Router.Navigation ],

  render: function () {
    return (
      <div className="container">
        <TopNavbar/>
        { }
        <RouteHandler/>
      </div>
    );
  }
});

var routes = (
  <Route handler={App}>
    <Route name="dashboard" path="/dashboard" handler={Dashboard}/>
    <Route name="view" path="/view" handler={View}/>
    <Route name="clients" path="/clients" handler={ClientListView}/>
    <Route name="client" path="/clients/:clientId" handler={ClientEdit}/>
  </Route>
);


if(typeof(document) !== "undefined"){
  Router.run(routes, Router.HistoryLocation, function (Handler) {
      React.render(<Handler/>, document.getElementById('example'));
          
  });
}
else{
    Router.run(routes, function (Handler) {
      module.exports = Handler;
  });
}
