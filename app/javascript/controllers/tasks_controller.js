import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  static targets = ["checkbox", "title"]

  toggle(event) {
    const checkbox = this.checkboxTarget;
    const titleElement = this.titleTarget;

    if (checkbox.checked) {
      titleElement.classList.add("text-decoration-line-through", "text-muted");
    } else {
      titleElement.classList.remove("text-decoration-line-through", "text-muted");
    }

    this.element.requestSubmit(); // submete o formulário ao servidor via Turbo, enviando a alteração no campo completed
  }
}
