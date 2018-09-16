const { environment } = require('@rails/webpacker');
const vue =  require('./loaders/vue');

// const sassLoader = environment.loaders.get('sass')
// const css = environment.loaders.get('css')
// const cssLoader = sassLoader.use.find(loader => loader.loader === 'css-loader')

// cssLoader.options = Object.assign(cssLoader.options, {
//   modules: true,
//   localIdentName: '[name]__[local]--[hash:base64:5]'
// })

environment.loaders.append('vue', vue);

module.exports = environment
