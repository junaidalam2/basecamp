// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="nested-form"
// export default class extends Controller {
//   connect() {
//   }
// }
import NestedForm from '@stimulus-components/rails-nested-form'

export default class extends NestedForm {
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }
}