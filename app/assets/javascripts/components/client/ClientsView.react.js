var React = require('react');
var _ = require('lodash');
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;

//Actions
var ClientActionCreators = require('../../actions/ClientActionCreators');

//Stores
var ClientStore =  require('../../stores/ClientStore');

//Components
var Table = require('react-bootstrap/Table');



var ClientListView = React.createClass({
    displayName: 'ClientListView',
    mixins: [Router.Navigation],

    _onChange(){
        this.setState({
            clients: ClientStore.getClients()
        });
    },

    componentDidMount(){
        var listener = ClientStore.addChangeListener(function(){
            this._onChange();
            listener.dispose();
        }, this);
        ClientActionCreators.loadClients();
    },

    getInitialState(){
        return ClientStore.getInitialState()
    },

    getColumns(){
        var ret = [];
        for (var key in this.state.clients && this.state.clients[0]){
                ret.push({key: key, label : key.split('_').join(' ')});
        }
        return ret;
    },

    render: function () {
        return ( <div> </div> );
    }
});

module.exports = ClientListView;
