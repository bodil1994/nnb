import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-loans"
export default class extends Controller {
  static targets = ["amountSlider", "amountShow", "form", "list"]

  connect() {
  }
  updateAmount(event) {
    this.amountShowTarget.innerHTML = event.target.value
    const url = `${this.formTarget.action}?amount=${event.target.value}`
    fetch(url, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        this.listTarget.innerHTML = data.loans
      })
  }
}
