import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress"
export default class extends Controller {
  static values = { percentage: Number }

  connect() {
    this.updateProgressBar();
  }

  updateProgressBar() {
    const progressBar = this.element.querySelector(".progress-bar");
    if (progressBar) {
      progressBar.style.width = `${this.percentageValue}%`;
      progressBar.setAttribute("aria-valuenow", this.percentageValue);
      progressBar.textContent = `${this.percentageValue}%`;
    }
  }

  update(percentage) {
    this.percentageValue = percentage;
    this.updateProgressBar();
  }
}
