import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';
import { put } from '@rails/request.js';

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this)
    })
  }

  onEnd(e) {
    console.log(e.item.dataset.sortableId);
    console.log(e.newIndex);
    put(`/projects/${e.item.dataset.sortableId}/sort`, {
      body: JSON.stringify({row_order_position: e.newIndex})
    })
  }
}
