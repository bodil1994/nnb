import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["alert"]
  connect() {
      console.log("alert controller js ")
  }

  close () {
   this.alertTarget.classList.add("hideMe");
   document.getElementById("alert").classList.add("d-none");
   document.getElementById("alert").classList.remove("d-block"); /* d-block is just a placeholder to not make class dissappear */
   this.alertTarget.remove();
  //  wait(1000);

  }
}
