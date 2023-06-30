import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ 'overlay', 'window' ];

  hideModal(e) {
    // e.preventDefault();
    this.element.parentElement.removeAttribute('src')
    this.element.remove()
  }

  checkClick(e) {
    if (this.overlayTarget.contains(e.target) && !this.windowTarget.contains(e.target)) {
      this.hideModal();
    }
  }
}
