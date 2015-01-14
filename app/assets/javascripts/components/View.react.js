var React = require('react');
var DataGrid = require('./DataGrid/DataGrid.react.js');

var View = React.createClass({
    displayName: 'View',

    render: function () {
        var data = [
          {favoriteColor:'blue',  age: 30, name: "Athos",      job: "Musketeer"},
          {favoriteColor: 'red' ,  age: 33, name: "Porthos",    job: "Musketeer"},
          {favoriteColor: 'blue' ,  age: 27, name: "Aramis",     job: "Musketeer"},
          {favoriteColor: 'orange' ,  age: 25, name: "d'Artagnan", job: "Guard"}
        ];
        return (<DataGrid data={data}/>);
    }
});

module.exports = View;