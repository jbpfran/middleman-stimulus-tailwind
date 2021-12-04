module.exports = {
  plugins: [
    require('postcss-import'),
    require('tailwindcss'),
    //require('autoprefixer'),
    require('postcss-nested'),
    //'postcss-easy-import': { prefix: '_', extensions: ['.css', '.scss'] },
  ]
}