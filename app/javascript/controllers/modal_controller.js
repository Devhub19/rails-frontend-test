import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    console.log(this.data)
    this.modalIdentifier = this.data.get("identifier") || "default";
  }

  show(e) {
    e.preventDefault();

    this.modalTarget.open = true
    document.querySelector('.desktop-overlay').style.zIndex = 0
    this.modalTarget.querySelectorAll('x-transition').forEach((transition) => {
      transition.open = true
    })
  }


  hide() {
    this.modalTarget.hidden = true;
  }
}
