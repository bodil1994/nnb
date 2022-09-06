import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="avatar-dropdown"
export default class extends Controller {
  connect() {
    console.log("hello")
  }

  showMenu () {
    console.log("hi")
  }
}
