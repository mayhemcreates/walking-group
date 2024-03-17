# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.4
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.4
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @7.1.3
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2.11.2/dist/esm/index.js"
pin "@rails/actioncable", to: "https://cdn.jsdelivr.net/npm/@rails/actioncable@7.1.3-2/app/assets/javascripts/actioncable.esm.js"
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@3.1.2/dist/mapbox-gl.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
