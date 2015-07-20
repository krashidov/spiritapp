var ClientEdit = require('./ClientEdit.react');
var ClientStore = require('../../stores/ClientStore');
var React = require('react');
var Marty = require('marty')

var ClientEditContainer = Marty.createContainer(ClientEdit, {
  listenTo: 'ClientStore',

  propTypes:{
    clientId: React.PropTypes.string.isRequired
  },

  fetch: {
    client(){
      return this.app.ClientStore.getClient(this.props.clientId)
    }
  },

  failed(errors) {
    return <div className="User User-failedToLoad">{errors}</div>;
  },
});

module.exports = ClientEditContainer;