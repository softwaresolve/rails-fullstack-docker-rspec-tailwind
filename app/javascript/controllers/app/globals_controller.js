import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="app--globals"
export default class extends Controller {
  static targets = ["focusable"]

  initialize() {
    const focusedElement = this.element.querySelector("ol > li.focus.snap-center")
    focusedElement?.scrollIntoView({ behavior: "smooth", block: "center" })

    const ol = this.element.querySelector('ol')
    const progressBarDiv = this.element.querySelector("#progressBar-container")

    // console.log(ol.offsetHeight)

    // progressBarDiv.setAttribute('style', `height: ${ol.offsetHeight}%;`)
    // progressBarDiv.style.height = ol.offsetHeight
  }
}
