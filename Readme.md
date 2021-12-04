# Middleman Turbo - Stimulus - Tailwind

This is my basic template for Middleman 4.x.

### It includes :
- [Turbo](https://turbo.hotwired.dev)
- [Stimulus 3](https://stimulus.hotwired.dev)
- [Tailwind CSS](https://tailwindcss.com)
- SASS
- HAML as default templating
in an external pipeline based on Webpack.

Some stimulus controller example are avalaible in 
  `assets/javascripts/controllers`

The stylesheet entry point is in
  `assets/stylesheets/`

Components are extracted in
  `components/`
So far I only included style in .saas file. In the future, I'd like to extract also the logic of the component to have a complete sidecar as in the view component framework.
You can nest tailwind @apply in sass/scss files or within mixins...

Classically helpers are in
  `helpers/`

You'll find some integration with Strapi (CMS) in the `lib/` folder

### Prerequisites
- Middleman 4.4.2
- NPM
- YARN
I built the pipeline with yarn but you can modify it to only use npm.

### Installation
Create your project using this git

    middleman init project_name -T jbpfran/middleman-stimulus-tailwind

    cd project_name

    bundle install

    yarn install

then you should be able to run
  `middleman serve`

### Configuration
Don't forget to change the name of the project in package.json

`"name": "middleman-turbo-stimulus-tailwind",`

The config.rb can also be (heavily) reviewed to fit your needs

The middleman-images extension needs extra installation if you want to fully use it
https://github.com/toy/image_optim_pack

### Contributions
Feel free to take it, use it, modify it.

1. Fork it
2. yarn install && bundle install
3. Create your feature branch (git checkout -b feature/my-new-feature)
4. Commit your changes (git commit -am 'Added some feature')
5. Push to the branch (git push origin my-new-feature)
6. Create new Pull Request