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
      if (window.location.href == "http://localhost:3000/") {
        const search_data = document.getElementById("search_data");
        search_data.addEventListener("input", function(event) {
          const text_search            = document.getElementById("text_search");
          const text_search_origin     = document.getElementById("text_search_origin");
          const location_search        = document.getElementById("location_search");
          const location_search_origin = document.getElementById("location_search_origin");
          text_search.value     = text_search_origin.value
          location_search.value = location_search_origin.value
        });
      }
      const dropdown_elements = document.getElementById("dropdown-toggle");
      dropdown_elements.addEventListener("click", function(event) {
        const original_array = [];
        const array = document.getElementById("main-field-dropdown").innerHTML.split("&nbsp;");
        original_array.push(array[0], "&nbsp;", event.target.innerText);
        document.getElementById("main-field-dropdown").innerHTML = original_array.join("");
        document.getElementById("category_id").value = event.target.innerText;
				$.ajax({
					url: "api/v1/offers",
					type: "get",
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
