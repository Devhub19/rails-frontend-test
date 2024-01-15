import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { FetchRequest } from '@rails/request.js'

// Connects to data-controller="sortable"
export default class extends Controller {
   connect() {
    console.log("connect")
    this.sortable = Sortable.create(this.element, {
      animation: 150,
      ghostClass: "sortable-ghost",
      chosenClass: "sortable-chosen",
      dragClass: "sortable-drag",
      onEnd: this.end.bind(this)
    })
  }

  async end(event) {
    const reasonId = event.item.id;
    const newPosition = event.newIndex +1;
      try {
      const response = await fetch('/storefronts/'+reasonId+'/update_position', {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-CSRF-Token': document.head.querySelector('[name="csrf-token"]').content,
        },
        body: JSON.stringify({ position: newPosition }),
      });

      if (response.ok) {
        console.log('Position updated successfully');
      } else {
        console.error('Failed to update position');
      }
    } catch (error) {
      console.error('Error updating position:', error);
    }
  } 

}
