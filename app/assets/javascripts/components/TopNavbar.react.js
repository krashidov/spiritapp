/** @jsx React.DOM */
var React = require('react');
var Navbar = require('react-bootstrap').Navbar;
var Nav = require('react-bootstrap').Nav;
var NavItem = require('react-bootstrap').NavItem;
var DropdownButton = require('react-bootstrap').DropdownButton;
var MenuItem = require('react-bootstrap').MenuItem;
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;


var TopNavbar = React.createClass({
    displayName: 'TopNavbar',
    render: function () {
        return (
            <Navbar>
              <Nav>
                <li>
                  <Link to="dashboard">Dashboard</Link>
                </li>
                <li>
                  <a data-method="delete" href="/users/sign_out" rel="nofollow">Logout</a>
                </li>
              </Nav>
            </Navbar>
        );
    }
});

module.exports = TopNavbar;