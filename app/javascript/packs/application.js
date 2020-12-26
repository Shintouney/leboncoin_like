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
jQuery.noConflict()(function ($) { // this was missing for me
  $(document).ready(function() {
    $('[data-submenu]').submenupicker();
  });
});
$(window).on('beforeunload', function(){
  $('[data-submenu]').submenupicker();
});
console.log('Hello from application.js')
