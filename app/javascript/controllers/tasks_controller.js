import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  dragStart(event) {
    event.target.style.opacity = "0.4"
    event.target.classList.add('is-dragging')

    event.dataTransfer.effectAllowed = "move"
    event.dataTransfer.setData('text/plain', event.target.getAttribute('data-task-id'))
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

    fetch(event.currentTarget.closest('form').action, {
      method: "PATCH",
      headers: {
        Accept: "text/vnd.turbo-stream.html",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.head.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({
        column: {
          tasks_attributes: {
            change_only_column: true,
            id: event.dataTransfer.getData('text/plain')
          }
        }
      }),
    })
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
