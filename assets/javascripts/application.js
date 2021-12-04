import * as Turbo from "@hotwired/turbo"

// stimulus 3.0
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"
//import Dropdown from "stimulus-dropdown"

window.Stimulus = Application.start()
const context = require.context("./controllers", true, /\.js$/)
Stimulus.load(definitionsFromContext(context))
//Stimulus.register("dropdown", Dropdown)

// enable Stimulus debug mode in development
Stimulus.debug = process.env.NODE_ENV === 'development'