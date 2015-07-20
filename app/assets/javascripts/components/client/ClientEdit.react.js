var React = require('react');
var _ = require('lodash');
var Router = require('react-router');
var { Route, RouteHandler, Link } = Router;
var  { Input } = require('react-bootstrap');

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
      const inputs = _.map(this.props.client, (value, key) => {
        debugger;
        return <Input type='text' value={ value } label={ key } labelClassName='col-xs-2' wrapperClassName='col-xs-10'/>;
      });

      return (
        <form>
          { inputs }
        </form>
      );
    }
});

module.exports = ClientEdit;