import "bootstrap"
import "@fortawesome/fontawesome-free/js/all";
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "jquery-ui"
window.jQuery = $;
window.$ = $;
import "bootstrap-submenu";
$( document  ).on('turbolinks:load', function() {
  $('[data-submenu]').submenupicker();
})
jQuery.noConflict()(function ($) {
  $(document).ready(function() {
    $('[data-submenu]').submenupicker();
  });
});
