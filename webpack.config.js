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
          test: /\.svg$/,
          loader: 'url-loader?mimetype=application/svg+xml'
      },
      {
          test: /\.woff$/,
          loader: 'url-loader?mimetype=application/font-woff'
      },
      {
          test: /\.woff2$/,
          loader: 'url-loader?mimetype=application/font-woff'
      },
      {
          test: /\.eot$/,
          loader: 'url-loader?mimetype=application/font-woff'
      },
      {
          test: /\.ttf$/,
          loader: 'url-loader?mimetype=application/font-woff'
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
