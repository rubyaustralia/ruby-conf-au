const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const TerserPlugin = require("terser-webpack-plugin");
const { WebpackManifestPlugin } = require('webpack-manifest-plugin');

module.exports = {
  mode: "production",
  entry: {
    '2013': './assets/2013/index.js',
    '2014': './assets/2014/index.js',
    '2015': './assets/2015/index.js',
    '2016': './assets/2016/index.js',
    '2017': './assets/2017/index.js',
    '2018': './assets/2018/index.js',
    '2019': './assets/2019/index.js',
    '2020': './assets/2020/index.js',
    '2023': './assets/2023/index.js',
    'footer': './assets/footer.js',
  },
  output: {
    path: path.resolve(__dirname, 'public/assets'),
    filename: '[contenthash].js',
  },
  resolve: {
    modules: ['node_modules', 'node_modules/foundation-sites/scss'],
  },
  module: {
    rules: [
      {
        test: /\.s[ac]ss$/i,
        use: [
          MiniCssExtractPlugin.loader,
          "css-loader",
          "postcss-loader",
          "sass-loader",
        ],
      },
      {
        test: /\.css$/i,
        use: [
          MiniCssExtractPlugin.loader,
          "css-loader",
          "postcss-loader",
        ],
      },
      {
        test: /\.(png|svg|jpg|jpeg|gif)$/i,
        type: 'asset/resource',
      },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/i,
        type: 'asset/resource',
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "[contenthash].css"
    }),
    new WebpackManifestPlugin({
      fileName: 'manifest.json',
      publicPath: '/assets/',
    }),
  ],
  optimization: {
    minimize: true,
    minimizer: [new TerserPlugin()],
  },
};
