'use strict';
const path = require('path');

const webpack = require('webpack');

module.exports = {
  entry: './app/assets/javascripts/app.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve('./app/assets/javascripts')
  },
  devtool: 'cheap-eval-source-map',
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['react','env'],
          }
        }
      },
      {
          test: /\.css$/,
          use: ['style-loader', 'css-loader']
      },
      {
        test: /\.png$/i,
        loaders: [
          'file-loader',
          {
            loader: 'image-webpack-loader'
          }
        ]
      }
    ]
  }
}
