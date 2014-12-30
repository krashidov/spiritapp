/** @jsx React.DOM */
var React = require('react');
var Navbar = require('react-bootstrap/Navbar');
var Nav = require('react-bootstrap/Nav');
var NavItem = require('react-bootstrap/NavItem');
var DropdownButton = require('react-bootstrap/DropdownButton');
var MenuItem = require('react-bootstrap/MenuItem');
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;


var TopNavbar = React.createClass({
    displayName: 'TopNavbar',
    render: function () {
        return (
            <Navbar>
              <Nav>
                <NavItem eventKey={1} href="#">Link</NavItem>
                <NavItem eventKey={2} href="#">Link</NavItem>
                <DropdownButton eventKey={3} title="Dropdown">
                  <MenuItem eventKey={1}>
                    <Link to="dashboard">Dashboard</Link>
                  </MenuItem>
                </DropdownButton>
              </Nav>
            </Navbar>
        );
    }
});

module.exports = TopNavbar;