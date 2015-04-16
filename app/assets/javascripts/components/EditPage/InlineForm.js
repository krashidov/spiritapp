var React = require('react');
var _ = require('lodash');

var Input = require('react-bootstrap').Input;
var Button = require('react-bootstrap').Button;

var InlineForm = React.createClass({
    displayName: 'InlineForm',
    propTypes: {
      onSubmitHandler: React.PropTypes.func.isRequired,
      onBlurHandler: React.PropTypes.func,
      placeholder: React.PropTypes.string,
      inputType: React.PropTypes.string,
      defaultValue: React.PropTypes.string,
      addonBefore: React.PropTypes.string,
    },

    getInitialState(){
      return {
        value: this.props.defaultValue || ''
      };
    },

    getDefaultProps() {
      return {
        inputType: 'text'
      };
    },

    _getSubmitButton(){
      return (<Button type="submit">Save</Button>);
    },

    _onChange(){
      this.setState({
        value: this.refs.input.getValue()
      });
    },

    _onSubmit(e){
      this.props.onSubmitHandler(e, this.refs.input.getValue());
    },

    _onBlur(e){
      debugger;
      this.props.onBlurHandler(e, this.refs.input.getValue());
    },

    render: function () {
      return (
        <form onSubmit={this._onSubmit}>
          <Input 
            type={this.props.inputType}
            onBlur={this.props._onBlur}
            placeholder={this.props.placeholder}
            defaultValue={this.props.defaultValue}
            addonBefore={this.props.addonBefore}
            buttonAfter={this._getSubmitButton()}
            onChange={this._onChange}
            ref="input"
          />
        </form>
      );
    }
});

module.exports = InlineForm;