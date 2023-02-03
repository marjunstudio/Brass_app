const colors = require('tailwindcss/colors')

module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      gray: colors.gray,
      green: colors.green,
      red: colors.red,
      blue: colors.blue,
      sky: colors.sky,
      indigo: colors.indigo,
      cyan: '#82AAE3',
    },
    extend: {},
    backgroundImage: {
      'top-image': "url('/images/top_image.jpg')",
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
