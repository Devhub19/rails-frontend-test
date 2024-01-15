import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="eyes-hide"
export default class extends Controller {
// app/javascript/controllers/eyes_hide_controller.js
  static targets = ["icon", "status", "text"];
  toggle() {
    if (this.textTarget.classList.contains("hidden")) {
      this.textTarget.classList.remove("hidden");
      this.iconTarget.classList.remove("fa-eye-slash");
      this.statusTarget.textContent = "Visible";
    } else {
      this.textTarget.classList.add("hidden");
      this.iconTarget.classList.add("fa-eye-slash");
      this.statusTarget.textContent = "Hidden";
    }
  }
}
