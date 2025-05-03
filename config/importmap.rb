# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "item_price", to: "item_price.js"
pin "card" # @2.5.4pin "function-bind" # @1.1.2
pin "globalthis/polyfill", to: "globalthis--polyfill.js" # @1.0.4
pin "hasown" # @2.0.2
pin "is" # @3.3.0
pin "node.extend" # @2.0.3
pin "payment" # @2.4.7
pin "qj" # @2.0.0
