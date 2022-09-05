import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["status", "buttons"]
  connect() {
    console.log("Hello World!")
    console.log(this.statusTarget)
  }

  accept() {
     // RESOURCE_1: https://www.reddit.com/r/rails/comments/pjjxgr/just_a_quick_write_up_on_how_to_send_patch_or_put/
    // RESOURCE_2: https://onrails.blog/2018/03/13/stimulus-js-tutorial-how-do-i-update-my-model-from-a-checkbox/
    console.log("accept clicked")
    this.buttonsTarget.classList.add("d-none")
    const token = document.getElementsByName(
      "csrf-token"
      )[0].content;

    fetch(`${this.data.get("update-url")}?status=Active`, {
      method: 'PATCH',
      credentials: "include",
      dataType: "script",
      headers: {
              "X-CSRF-Token": token,
              Accept: "application/json"
       },
    }).then((response) => {
      console.log(response.status)
      if (response.status === 200) {
        console.log("Active Response 200")
          this.statusTarget.innerText = "Active"
      } else {
        "x" //* ADD ALERT HERE *//;
      }
    })
  }

  decline() {
    // RESOURCE_1: https://www.reddit.com/r/rails/comments/pjjxgr/just_a_quick_write_up_on_how_to_send_patch_or_put/
   // RESOURCE_2: https://onrails.blog/2018/03/13/stimulus-js-tutorial-how-do-i-update-my-model-from-a-checkbox/
   console.log("decline clicked")
   this.buttonsTarget.classList.add("d-none")
   const token = document.getElementsByName(
     "csrf-token"
     )[0].content;

   fetch(`${this.data.get("update-url")}?status=Declined`, {
     method: 'PATCH',
     credentials: "include",
     dataType: "script",
     headers: {
             "X-CSRF-Token": token,
             Accept: "application/json"
      },
   }).then((response) => {
     console.log(response.status)
     if (response.status === 200) {
       console.log("Declined Response 200")
         this.statusTarget.innerText = "Declined"
     } else {
       "x" //* ADD ALERT HERE *//;
     }
    })
  }

}
