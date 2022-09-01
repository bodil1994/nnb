import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-loans"
export default class extends Controller {
  static targets = ["amountSlider", "amountShow", "lengthSlider", "lengthShow", "form", "list", "categories"]

  connect() {
  }
  updateAmount(event) {
    this.amountShowTarget.innerHTML = event.target.value
    this.updateList()
  }
  updateLength(event) {
    this.lengthShowTarget.innerHTML = event.target.value
    this.updateList()
  }
  updateCategory(event) {
    console.log(this.categoriesTargets)
    const categories = this.categoriesTargets
    let checked_categories = ""
    categories.forEach((category) => {
      if(category.checked) {
        checked_categories = checked_categories + `&loan%5Bloan_category%5D%5B%5D=${category.value}`
      }
    })
    // console.log(checked_categories)
    // this.updateList(checked_categories)
  }
  updateList(checked_categories){
    const checked_categories = checked_categories || ""
    const url = `${this.formTarget.action}?length=${this.lengthShowTarget.innerHTML}&amount=${this.amountShowTarget.innerHTML}${checked_categories}`
    fetch(url, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        this.listTarget.innerHTML = data.loans
      })
  }
}
