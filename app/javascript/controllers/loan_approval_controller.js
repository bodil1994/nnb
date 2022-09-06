import { Controller } from "@hotwired/stimulus"
import { left } from "@popperjs/core"

export default class extends Controller {
  static targets = [ "buttons", "statusbutton"]
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


          // GET CURRENT DATE
          let today = new Date();
          const dd = String(today.getDate()).padStart(2, '0');
          const mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
          const yyyy = today.getFullYear();
          today = mm + '/' + dd + '/' + yyyy;

          // SHOW STATUS AND CURRENT DATE
          this.statusbuttonTarget.classList.remove("d-none")
          this.statusbuttonTarget.insertAdjacentHTML("afterbegin", `<p>Accepted<br>${today}</p>`)

          // SHOW ALERT
          const a = '<div class="alert alert__success" data-alert-target="alert"><p class="bold">🎉 Congratulations, your loan has been matched.</p><br><p> The loan has been deducted from your wallet and transferred to the borrower.</p><button data-action="click->alert#close"><i class="fa-regular fa-x"></i></button></div>';
          const flash = document.getElementById("flash")
          flash.insertAdjacentHTML("afterbegin", a)
          document.getElementById("alert").classList.add("d-block")
          document.getElementById("alert").classList.remove("d-none")
       } else {
        "x" //* ADD ALERT HERE *//;
      }
    })
  }

  remove() {
    rem
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

        // GET CURRENT DATE
        let today = new Date();
        const dd = String(today.getDate()).padStart(2, '0');
        const mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        const yyyy = today.getFullYear();
        today = mm + '/' + dd + '/' + yyyy;

        // SHOW STATUS AND CURRENT DATE
        this.statusbuttonTarget.classList.remove("d-none")
        this.statusbuttonTarget.insertAdjacentHTML("afterbegin", `<p>Declined<br>${today}</p>`)
     } else {
       "x" //* ADD ALERT HERE *//;
     }
    })
  }

}
