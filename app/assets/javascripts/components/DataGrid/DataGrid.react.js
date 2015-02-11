var React = require('react');
var _ = require('lodash');
var ClientActionCreators = require('../../actions/ClientActionCreators');
var ClientStore =  require('../../stores/ClientStore');
var Table = require('react-bootstrap/Table');

var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;


var DataGrid = React.createClass({
  displayName: 'DataGrid',
  mixins: [Router.Navigation],
  propTypes: {
      columns: React.PropTypes.array.isRequired,
      data: React.PropTypes.array.isRequired
  },

  _buildHeaders() {
    return this.props.columns.map( (column) => {
      return (<th>{column}</th>);
    });
  },

  _buildBody() {
    return this.props.data.map( (row) =>{
      var rowData = row.map((cell) =>{
        return (<td>{cell}</td>);
      });
      return (<tr>{rowData}</tr>);
    });
  },

  render: function () {
      return (
          <Table striped bordered condensed hover>
            <thead>
              <tr>{this._buildHeaders()}</tr>
            </thead>
            <tbody>
              {this._buildBody()}
            </tbody>
          </Table>
      );
  }
});

module.exports = DataGrid;
