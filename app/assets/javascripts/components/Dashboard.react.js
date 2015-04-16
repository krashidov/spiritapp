var React = require('react');
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;
var Row = require('react-bootstrap').Row;
var Col = require('react-bootstrap').Col;
var Button = require('react-bootstrap').Button;

var Dashboard = React.createClass({
  mixins: [ Router.State ],

  render: function () {
    debugger;
    return (
      <Row>
        <Col xs={4}>
          <Link to="view">
            <Button  bsStyle="primary">View Clients and Providers</Button>
          </Link>
        </Col>
        <Col xs={4}>
          <Button bsStyle="success">View Work Orders</Button>
        </Col>
        <Col xs={4}>
          <Button bsStyle="info">Add Item</Button>
        </Col>
      </Row>
    );
  }
});

module.exports = Dashboard;