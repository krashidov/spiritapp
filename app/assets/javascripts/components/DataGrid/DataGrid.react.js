var React = require('react');
var _ = require('lodash');
var Table = require('react-bootstrap/Table');

var DataGrid = React.createClass({
    displayName: 'DataGrid',

    propTypes: {
        data: React.PropTypes.array.isRequired
    },

    _getColumns: function() {
        return _.keys(this.props.data[0]).map(function(column, key) {
            return (<th key={key}>{column}</th>);
        });
    },

    _getRows: function() {
        return this.props.data.map(function(row, key){
            var rowItems =  _.map(row, function(rowItem, key){
                return (<td key={key}>{rowItem}</td>);
            });
            return (<tr>{rowItems}</tr>);
        });
    },

    render: function () {
        return (
            <Table striped bordered condensed hover>
                <thead>
                    <tr>
                        {this._getColumns()}
                    </tr>
                </thead>
                <tbody>
                    {this._getRows()}
                </tbody>
            </Table>
        );
    }
});

module.exports = DataGrid;