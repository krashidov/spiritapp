var React = require('react');
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;
var TopNavbar = require('./TopNavbar.react.js');
var Grid = require('react-bootstrap').Grid;
var Dashboard = require('./Dashboard.react.js');
var View = require('./View.react.js');
var ClientEdit = require('./client/ClientEdit.react.js');
var ClientEditContainer = require('./client/ClientEditContainer.react.js');
var ClientListView = require('./client/ClientListView.react.js');
var Marty = require('marty');

class Application extends Marty.Application {
    constructor(options) {
        super(options);
        this.register('clientStore', require('../stores/ClientStore'));
    }
}

var app = new Application();
var ApplicationContainer = require('marty').ApplicationContainer;


class App extends React.Component{
  render() {
    return (
      <ApplicationContainer app={app}>
        <div className="container">
          <TopNavbar/>
          { }
          <RouteHandler/>
        </div>
      </ApplicationContainer>
    );
  }
};

var routes = (
  <Route handler={App}>
    <Route name="dashboard" path="/dashboard" handler={Dashboard}/>
    <Route name="view" path="/view" handler={View}/>
    <Route name="clients" path="/clients" handler={ClientListView}/>
    <Route name="client" path="/clients/:clientId" handler={ClientEditContainer}/>
  </Route>
);


if(typeof(document) !== "undefined"){
  Router.run(routes, Router.HistoryLocation, function (Handler, state) {
      React.render(<Handler {...state}/>, document.getElementById('example'));
          
  });
}
else{
    Router.run(routes, function (Handler) {
      module.exports = Handler;
  });
}
