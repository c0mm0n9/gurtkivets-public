// Custom element definition
class CustomElement extends HTMLElement {
    constructor() {
        super();
        // Fetch the HTML content from the JSP file
        fetch('src/main/webapp/resources/jsp/menu.jsp')
            .then(response => response.text())
            .then(html => {
                // Inject the JSP content into the shadow DOM
                this.shadowRoot.innerHTML = html;
            })
            .catch(error => console.error('Error fetching JSP content:', error));
    }
}

// Define the custom element
customElements.define('menu-element', CustomElement);
