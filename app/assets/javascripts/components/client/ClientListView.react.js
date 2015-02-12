var React = require('react');
var _ = require('lodash');
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


var ClientListView = React.createClass({
    displayName: 'ClientListView',
    mixins: [Router.Navigation, ClientState],

    componentDidMount(){
        ClientActionCreators.loadClients();
    },

    getInitialState(){
        return ClientStore.getInitialState()
    },

    getColumns(){
        var ret = [];
        for (var key in this.state.clients && this.state.clients[0]){
                ret.push(key.split('_').join(' '));
        }
        return ret;
    },

    _getClientMarkup(){
        return _.map(this.state.clients, (client) =>{
            client.id = (<Link to="client" params={{clientId: client.id}}>{client.id}</Link>);
            return client;
        });
    },

    _onRowClick(clientId){
        this.transitionTo('client', {clientId: clientId});
    },

    render: function () {
        console.log(this.state);
        return ( <DataGrid columns={this.getColumns()} data={this.state.clients} rowClickHandler={this._onRowClick}></DataGrid> );
    }
});

module.exports = ClientListView;

