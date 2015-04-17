var React = require('react');
var _ = require('lodash');
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;

//Stores
var ClientStore =  require('../../stores/ClientStore');

//Mixins
var ClientState = require('../../mixins/ClientMixin.js');

//Components
var InlineForm = require('../EditPage/InlineForm');

var ClientEdit = React.createClass({
    // displayName: 'ClientEdit',
    // mixins: [ClientState, Router.State],

    // getState(){
    //   debugger;
    //   return {
    //     currentClient: ClientStore.getClient(this.getParams().clientId)
    //   };
    // },

    // componentWillUpdate(){
    //   return this.setState({
    //     currentClient: ClientStore.getClient(this.getParams().clientId)
    //   });
    // },

    // onFormSubmit(e, value){
    //   e.preventDefault();
    // },

    // _generateForm(){
    //   debugger;
    // },

    render() {
      return (<div>Jello jorld!</div>);
    }
});

module.exports = ClientEdit;