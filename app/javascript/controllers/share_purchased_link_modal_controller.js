// app/javascript/controllers/share_purchased_link_modal_controller.js
import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// dialog id="share-purchased-link-modal"
export default class extends Controller {
    static targets = ["sharedLink"]

    connect() {
        console.log("Share purchased link modal controller")
    }

    copy(event) {
        event.preventDefault()
        const copyBtn = event.currentTarget

        navigator.clipboard.writeText(this.sharedLinkTarget.value);

        copyBtn.classList.add('btn-success');
        setTimeout(() => copyBtn.classList.remove('btn-success'), 1200);
    }

    close(event) {
        Turbo.visit(location.href);
    }

    // generateLink(event) {
    //     event.preventDefault()
    //     const url = '/shared_purchase_links.json'

    //     fetch(url, {
    //         method: 'POST',
    //         headers: {
    //             'Content-Type': 'application/json',
    //             'Accept': 'application/json',
    //             // Rails CSRF token is often needed for POST/PUT/DELETE requests
    //             'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
    //         }
    //     })
    //         .then(response => {
    //             if (!response.ok) {
    //                 throw new Error('Shared link cannot be generated')
    //             }
    //             return response.json() // or response.text() or response.html()
    //         })
    //         .then(data => {
    //             navigator.clipboard.writeText(data.link);
    //             console.log(`Generated: ${data.link}`)
    //         })
    //         .catch(error => {
    //             console.error('There has been a problem to generate shared purchase link:', error)
    //         })
    // }
}
