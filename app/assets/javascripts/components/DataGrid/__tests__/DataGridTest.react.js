/** @jsx React.DOM */

// __tests__/DataGridTest.js
var React = require('react/addons');
var TestUtils = React.addons.TestUtils;


jest.dontMock('../DataGrid.react.js');
jest.dontMock('lodash');

function renderDataGrid(data){
  var DataGrid = require('../DataGrid.react.js');
  return TestUtils.renderIntoDocument(
      <DataGrid data={data}/>
  );
};


describe('DataGrid', function() {
  describe('rows and columns', function() {
    var data = [
      {favoriteColor:'blue',  age: 30, name: "Athos",      job: "Musketeer"},
      {favoriteColor: 'red' ,  age: 33, name: "Porthos",    job: "Musketeer"},
      {favoriteColor: 'blue' ,  age: 27, name: "Aramis",     job: "Musketeer"},
      {favoriteColor: 'orange' ,  age: 25, name: "d'Artagnan", job: "Guard"}
    ];

    var DataGrid = renderDataGrid(data);
    var columns = TestUtils.scryRenderedDOMComponentsWithTag(DataGrid, 'th');
    var tbody = TestUtils.scryRenderedDOMComponentsWithTag(DataGrid, 'tbody');

    it('creates 4 rows when there are 4 columns', function(){
      expect(tbody[0].props.children.length).toBe(4);
    });

    it('creates 4 columns when there are 4 rows', function(){
      expect(columns.length).toBe(4);
    });
  });

  it
});