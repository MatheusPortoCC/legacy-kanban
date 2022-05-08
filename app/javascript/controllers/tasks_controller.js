import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  dragStart(event) {
    event.target.style.opacity = "0.4"
    event.target.classList.add('is-dragging')

    event.dataTransfer.effectAllowed = "move"
    event.dataTransfer.setData('task-id', event.target.getAttribute('data-task-id'))
  }

  drag(event) {
  }

  dragEnd(event) {
    event.target.style.opacity = "1.0"
    event.target.classList.remove('is-dragging')
  }

  drop(event) {
    event.stopPropagation()
    event.preventDefault()

    const isDraggingCard = document.querySelector('.is-dragging')
    if (isDraggingCard){
      event.currentTarget.prepend(isDraggingCard)
    }

    event.target.classList.remove('border-dotted')

    fetch(window.location.pathname + '/tasks', {
      method: "PATCH",
      headers: {
        Accept: "text/vnd.turbo-stream.html",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.head.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({
        id: event.dataTransfer.getData('task-id'),
        task: {
          column_id: event.currentTarget.closest('.column').dataset.columnId
        }
      }),
    })
    isDraggingCard.remove()
  }

  dragLeave(event) {
    event.preventDefault()
  }

  dragOver(event) {
    event.preventDefault()
  }

  dragEnter(event) {
    event.preventDefault()
  }
}
