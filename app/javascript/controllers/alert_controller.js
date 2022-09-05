import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["alert"]
  connect() {
      console.log("alert controller js connected")
  }

  close () {
   this.alertTarget.remove()
  }
}
