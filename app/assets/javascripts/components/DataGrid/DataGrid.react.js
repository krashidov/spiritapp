var React = require('react');
var _ = require('lodash');
var Reactable = require('reactable');
var ServerActionCreators = require('../../actions/ServerActionCreators');
var ClientStore =  require('../../stores/ClientStore');
var Table = Reactable.Table;
var Tr = Reactable.Tr;

var DataGrid = React.createClass({
    displayName: 'DataGrid',

    handleClick() {
        ServerActionCreators.loadClients();
    },

    render: function () {
        return (
            <a onClick={this.handleClick}>click</a>
        );
    }
});

module.exports = DataGrid;