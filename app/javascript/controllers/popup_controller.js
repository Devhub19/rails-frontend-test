import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ["popup"]
  static values = { index: String }

  showPopup() {
    this.popupTarget.style.display = "block";
  }

  hidePopup() {
    this.popupTarget.style.display = "none";
  }

  togglePopup() {
    console.log("workingg")
    if (this.popupTarget.style.display === "block") {
      this.hidePopup();
    } else {
      this.showPopup();
    }
  }

  connect() {
  }
}
