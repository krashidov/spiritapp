var path = require('path');
var webpack = require('webpack');
var commonsPlugin = new webpack.optimize.CommonsChunkPlugin('shared.js');
var reactPath = './app/assets/javascripts/components/';

module.exports = {
  entry: {
    'App':path.resolve(reactPath, 'app.react.js')
  },
  output: {
    path: './app/assets/javascripts/built',
    filename: '[name].js',
    library: ['Spirit', '[name]'],
    libraryTarget: 'this'
  },
  externals: {
    'jquery': 'jQuery',
    'react': 'React'
  },
  resolve: {
    modulesDirectories: [
      'node_modules',
      'app/assets/javascripts/components'
    ]
  },

  plugins: [new webpack.IgnorePlugin(/vertx/)],
  
  extensions: ['', '.js', '.js.erb', '.react.js'],
  module: {
    loaders: [
      {test: /\.react\.js$/, loader: 'jsx-loader?harmony'},
      {test: /\.react\.js$/, loader: 'jsx-loader?insertPragma=React.DOM'}
    ]
  }
};
