var React = require('react');
var _ = require('lodash');
var ClientActionCreators = require('../../actions/ClientActionCreators');
var ClientStore =  require('../../stores/ClientStore');
var Table = require('react-bootstrap').Table;

var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;

var DataGridRow =  require('./DataGridRow.react.js')
var DataGrid = React.createClass({
  displayName: 'DataGrid',
  mixins: [Router.Navigation],
  propTypes: {
      columns: React.PropTypes.array.isRequired,
      data: React.PropTypes.array.isRequired,
      rowClickHandler: React.PropTypes.func
  },

  _buildHeaders() {
    return _.isEmpty(this.props.columns) ? [] : this.props.columns.map( (column) => {
      return (<th>{column}</th>);
    });
  },

  _buildBody(){
    return _.map(this.props.data, (client) =>{
      return (<DataGridRow id={client.id} data={client} rowClickHandler={this.props.rowClickHandler}/>);
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
