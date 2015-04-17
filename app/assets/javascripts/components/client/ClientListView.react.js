var React = require('react');
var _ = require('lodash');
var Marty = require('marty');
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;
//Actions
var ClientActionCreators = require('../../actions/ClientActionCreators');

//Stores
var ClientStore =  require('../../stores/ClientStore');

//Components
var DataGrid = require('../DataGrid/DataGrid.react.js');

//Mixins
var ClientState = require('../../mixins/ClientMixin.js');

class ClientListView extends React.Component {
  componentDidMount(){
    ClientActionCreators.loadClients();
  }

  getColumns(){
    var clients = this._getClients();
    var ret = [];
    for (var key in clients && clients[0]){
        ret.push(key.split('_').join(' '));
    }
    return ret;
  }

  _getClientMarkup(){
    return _.map(this._getClients(), (client) =>{
      client.id = (<Link to="client" params={{clientId: client.id}}>{client.id}</Link>);
      return client;
    });
  }

  _onRowClick(clientId){
    this.context.router.transitionTo('client', {clientId: clientId});
  }

  _getClients(){
    return _.map(this.props.clients, function(client) { 
      return _.pick(client, 
      ['id',
      'first_name',
      'last_name',
      'address', 
      'city',
      'postal_code',
      'state',
      'hours_plus_travel', 
      'date_of_birth']);
    });
  }

  render() {
    console.log(this.state);
    return ( <DataGrid columns={this.getColumns()} data={this._getClients()} rowClickHandler={this._onRowClick.bind(this)}></DataGrid> );
  }
};

ClientListView.contextTypes = {
  router: React.PropTypes.func
};

ClientListView.prototype.displayName = 'ClientListView';

module.exports = Marty.createContainer(ClientListView, {
  listenTo: ClientStore, 
  fetch: {
    clients(){
      return ClientStore.getClients()
    }
  }
});

