// tailwind.config.js
const colors = require('tailwindcss/colors')

module.exports = {
  purge: [
    './source/**/*.html',
    './source/**/*.haml',
    './assets/**/*.css',
    './assets/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      minHeight: {
        '0': '0',
        '1/4': '25%',
        '1/2': '50%',
        '3/4': '75%',
        'full': '100%',
      },
      height: {
        sm: '320px',
        md: '576px',
        lg: '720px',
        xl: '1024px',
      },
      maxHeight: {
        '0': '0',
        '1/4': '25vh',
        '1/2': '50vh',
        '3/4': '75vh',
        '4/5': '80vh',
        'full': '100vh',
      }
    },
  },
  variants: {
    borderWidth: ['hover', 'focus'],
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
  ],
}