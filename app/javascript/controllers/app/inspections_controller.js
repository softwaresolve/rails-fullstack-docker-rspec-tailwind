import { Controller } from "@hotwired/stimulus"
import { post } from '@rails/request.js'

// Connects to data-controller="app--inspections"
export default class extends Controller {
  connect() {
    console.log('connected')
  }

  handleChangeProject(e) {
    const projectId = e.target.value

    post('/inspections/selects/project', {
      body: JSON.stringify({ project_id: projectId }),
      responseKind: "turbo-stream"
    })
  }

  handleChangeBuilding(e) {
    const buildingId = e.target.value

    post('/inspections/selects/building', {
      body: JSON.stringify({ building_id: buildingId }),
      responseKind: "turbo-stream"
    })
  }
}
