module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
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
