var React = require('react');
var DataGrid = require('./DataGrid/DataGrid.react.js');

var View = React.createClass({
    displayName: 'View',

    _getData() {
      return [
        [(<span>Hello</span>), (<span>Goodby</span>)],
        [(<span>Hola</span>), (<span>Arrivaderchi</span>)]
      ];
    },

    _getColumns() {
      return ['Greeting', 'Salutations'];
    },

    render: function () {
        return (<DataGrid data={this._getData()} columns={this._getColumns()}/>);
    }
});

module.exports = View;