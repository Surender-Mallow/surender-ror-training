import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide-company"
export default class extends Controller {
  static targets= ["userType", "company"]
  static values = { showIf: String }

  connect() {
    this.toggle()
  }

  toggle() {
    if (this.userTypeTarget.value != this.showIfValue) {
      this.companyTarget.hidden = true
    } else if (this.userTypeTarget.value == this.showIfValue) {
      this.companyTarget.hidden = false
    }
  }
}
