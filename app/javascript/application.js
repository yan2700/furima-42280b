// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "item_price"

document.addEventListener("turbo:submit-end", function(event) {
  if (event.detail.success) {
    // 成功した場合、リダイレクト
    window.location.href = "/items"; // または適切なリダイレクト先
  }
});
