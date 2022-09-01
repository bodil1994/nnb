import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-loans"
export default class extends Controller {
  static targets = ["amountSlider", "amountShow", "lengthSlider", "lengthShow", "form", "list", "categories"]

  connect() {
  }
  getCategories() {
    const categories = this.categoriesTargets
    let checked_categories_string = ""
    categories.forEach((category) => {
      if(category.checked) {
        checked_categories_string = checked_categories_string + `&loan%5Bloan_category%5D%5B%5D=${category.value}`
      }
    })
    return checked_categories_string
  }
  updateAmount(event) {
    this.amountShowTarget.innerHTML = `${event.target.value} €`
    const checked_categories = this.getCategories()
    this.updateList(checked_categories)
  }
  updateLength(event) {
    this.lengthShowTarget.innerHTML = `${event.target.value} months`
    const checked_categories = this.getCategories()
    this.updateList(checked_categories)
  }
  updateCategory(event) {
    const categories = this.getCategories()
    // console.log(categories)
    this.updateList(categories)
  }
  updateList(categories){
    const url = `${this.formTarget.action}?length=${this.lengthSliderTarget.value}&amount=${this.amountSliderTarget.value}${categories}`
    // console.log(this.amountSliderTarget.value)

    fetch(url, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        this.listTarget.innerHTML = data.loans
      })
  }
}
