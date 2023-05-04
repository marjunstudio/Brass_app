import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

// Stimulusフレームワークを使用
import { Application } from '@hotwired/stimulus'
import { Autocomplete } from 'stimulus-autocomplete'

const application = Application.start()
application.register('autocomplete', Autocomplete)
application.debug = false
window.Stimulus   = application

export { application }


Rails.start()
Turbolinks.start()
// ActiveStorage.start()

import "channels"
import "stylesheets/application.css"