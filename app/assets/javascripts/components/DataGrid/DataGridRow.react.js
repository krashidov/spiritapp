var React = require('react');
var _ = require('lodash');

var DataGridRow = React.createClass({
  displayName: 'DataGridRow',
  propTypes: {
      data: React.PropTypes.array.isRequired,
      id: React.PropTypes.string,
      rowClickHandler: React.PropTypes.func
  },

  _onRowClick(client){
    this.props.rowClickHandler(this.props.id);
  },

  _buildRow() {
    return _.map(this.props.data, (cell) =>{
      return (<td>{cell}</td>);
    })
  },

  render: function () {
      return (
        <tr onDoubleClick={this._onRowClick}>
        {this._buildRow()}
        </tr>
      );
  }
});

module.exports = DataGridRow;
