import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["alert", "background"]
  connect() {
      console.log("alert controller js ")
  }

  close () {

    const sleep = (milliseconds) => {
      return new Promise(resolve => setTimeout(resolve, milliseconds))
    }

   this.alertTarget.classList.add("hideMe");
   document.getElementById("alert").classList.add("d-none");
   document.getElementById("alert").classList.remove("d-block"); /* d-block is just a placeholder to not make class dissappear */
   this.alertTarget.remove();
   this.backgroundTarget.remove();
  }


  reload(){
    window.location.reload();
    this.close()
}
}
