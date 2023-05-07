// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// Bootstrapの記述↓
import "jquery";
import "popper.js";
import "bootstrap";

import "../stylesheets/application"
import "../stylesheets/sessions"
import "../stylesheets/registrations"
import "../stylesheets/posts"
import "../stylesheets/top"
import "../stylesheets/users"
import "../stylesheets/notifications"
// FontAwesomeの記述
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
