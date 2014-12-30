var React = require('react');
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;
var TopNavbar = require('./TopNavbar.react.js');
var Grid = require('react-bootstrap/Grid');
var Dashboard = require('./Dashboard.react.js')
var App = React.createClass({

  mixins: [ Router.Navigation ],

  render: function () {
    return (
      <Grid className="container-fluid">
        <TopNavbar/>
        { }
        <RouteHandler/>
      </Grid>
    );
  }
});

var routes = (
  <Route handler={App}>
    <Route name="dashboard" path="/dashboard" handler={Dashboard}/>
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
