import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-messages"
export default class extends Controller {
  static targets = ["alert"];

  connect() {
    if (this.hasAlertTarget) {
      setTimeout(() => {
        this.removeFlashMessage();
      }, 5000);
    }
  }

  removeFlashMessage() {
    // Remove o elemento da div flash
    this.element.remove();
  }
}
