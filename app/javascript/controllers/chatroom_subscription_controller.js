import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chatroom-subscription"
import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
  }
}
