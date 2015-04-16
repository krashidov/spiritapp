var React = require('react');
var _ = require('lodash');

var EditPage = React.createClass({
    displayName: 'EditPage',

    onFormSubmit(){

    },

    render: function () {
      debugger;
        return (<InlineForm  onSubmitHandler={this.onFormSubmit}/>);
    }
});

module.exports = EditPage;