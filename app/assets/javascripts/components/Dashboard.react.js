var React = require('react');
var Router = require('react-router');
var Dashboard = React.createClass({
  mixins: [ Router.State ],

  render: function () {
    return (
      <div className="Dashboard">
        <h1>Dashboard!!!</h1>
      </div>
    );
  }
});

module.exports = Dashboard;