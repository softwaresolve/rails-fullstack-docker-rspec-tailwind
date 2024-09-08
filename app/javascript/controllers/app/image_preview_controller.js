import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="app--image-preview"
export default class extends Controller {
  static targets = [
    "imagePlaceholder",
    "inputField",
    "cleanUpImageField"
  ]

  static originalPlaceholderUrl = ''

  initialize() {
    this.originalPlaceholderUrl = this.imagePlaceholderTarget.src

    this.inputFieldTarget.addEventListener('change', this._setPlaceholder.bind(this))
    this.cleanUpImageFieldTarget.addEventListener('click', this._resetPlaceholder.bind(this))
  }

  _resetPlaceholder(e) {
    e.preventDefault()

    if (this.inputFieldTarget.value) {
      this.inputFieldTarget.value = ''
      this.imagePlaceholderTarget.setAttribute('src', this.originalPlaceholderUrl)
    }
  }

  _setPlaceholder(e) {
    e.stopPropagation()
    const file = this.inputFieldTarget.files[0]

    if (file) this.imagePlaceholderTarget.setAttribute('src', URL.createObjectURL(file))
  }
}
