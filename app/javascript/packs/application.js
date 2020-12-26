import "bootstrap"

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "jquery-ui"
window.jQuery = $;
window.$ = $;
import "bootstrap-submenu";
$( document ).ready(function() {
	$('[data-submenu]').submenupicker();
});
console.log('Hello from application.js')
