import "bootstrap"
import "@fortawesome/fontawesome-free/js/all";
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "jquery-ui"
window.jQuery = $;
import "bootstrap-submenu";
$( document  ).on('turbolinks:load', function() {
  $('[data-submenu]').submenupicker();
  jQuery.noConflict()(function ($) {
    $(document).ready(function() {
      $('[data-submenu]').submenupicker();
      const dropdown_elements = document.getElementById("dropdown-toggle");
      dropdown_elements.addEventListener("click", function(event) {
        const original_array = [];
        const array = document.getElementById("main-field-dropdown").innerHTML.split("&nbsp;");
        original_array.push(array[0], "&nbsp;", event.target.innerText);
        document.getElementById("main-field-dropdown").innerHTML = original_array.join("");
        document.getElementById("search_category").value = event.target.innerText;
				$.ajax({
					url: "api/v1/offers",
					type: "get", //send it through get method
					data: {
						category: event.target.innerText
					},
					success: function(response) {
						const submit_button = document.getElementById("submit_button")
						const count         = response.offers
						submit_button.value = `Rechercher (${count} résultat)`
					},
					error: function(xhr) {
						console.log("api error")
					}
				});
      });
    });
  });
})
