'use strict';
const path = require('path'),
  ExtractTextPlugin = require("extract-text-webpack-plugin"),
  OptimizeCssAssetsPlugin = require('optimize-css-assets-webpack-plugin'),
  cssnano = require('cssnano');

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
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: [
              {
                loader: 'css-loader',
              }
            ],
        })
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
  },
  plugins: [
    new ExtractTextPlugin('../stylesheets/bootstrap.css'),
    new OptimizeCssAssetsPlugin({
        assetNameReqExp: /\.css$g/,
        cssProcessor: cssnano,
        cssProcessorOptions: { discardComments: {removeAll: true } },
        canPrint: true
    })
  ]
}
