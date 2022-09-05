import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["botton", "input", "label"]

  connect() {
    console.log("Hello from create loan js");
  }

  updateAmount(event) {
    this.inputTarget.value = event.target.value;
    this.inputTarget.name = '';
    console.log(this.inputTarget.value)
    this.labelTargets.forEach(element => {
      element.classList.remove('colors')
    });
  }

  removeColor() {
    console.log("huhu")
    this.labelTargets.forEach(element => {
      element.classList.add('colors')
    });
  }
}
