import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggle() {
    console.log("Stimulus dropdown toggle fired!")
    this.menuTarget.classList.toggle("hidden")
  }
}