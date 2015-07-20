var React = require('react');
var Marty = require('marty');
var Application = require('./martyApplication');
var ApplicationContainer = Marty.ApplicationContainer;
var TopNavbar = require('./components/TopNavbar.react');

window.React = React; // For React Developer Tools
window.Marty = Marty; // For Marty Developer Tools


var app = new Application();

app.rehydrate();

app.router.run(function (Handler, state) {
  React.render((
    <div className="container">
      <TopNavbar/>
      <ApplicationContainer app={app}>
        <Handler {...state.params} />
      </ApplicationContainer>
    </div>
  ), document.getElementById('example'));
});