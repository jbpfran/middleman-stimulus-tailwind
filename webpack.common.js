const path = require('path');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

module.exports = {
  //mode: 'development',
  entry: {
    application: ['./assets/javascripts/application.js'],
    style: ['./assets/stylesheets/site.scss'],
  },
  output: {
    path: path.resolve(__dirname, '.tmp/dist'),
    filename: '[name].js',
  },
  plugins: [
      new CleanWebpackPlugin()
    ]
};