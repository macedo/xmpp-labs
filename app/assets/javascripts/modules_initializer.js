modulejs.define(
  "ModulesInitializer",
  [
    "jquery"
  ],

  function($) {
    var ModulesInitializer = (function() {
      function ModulesInitializer() { }

      ModulesInitializer.init = function() {
        var instance = new this();
        instance.init();
        return instance;
      };

      ModulesInitializer.prototype.init = function() {
        this.fetchModules($(document));
      };

      ModulesInitializer.prototype.fetchModules = function(container) {
        var _this = this;
        return container.find("[data-modules]").each(function(i, element){
          var $element = $(element);
          $.each($element.data("modules").split(/\s+/), function(i, moduleName) {
            return _this.initializeModule($element, moduleName);
          });
        });
      };

      ModulesInitializer.prototype.initializeModule = function(container, name) {
        var newObject;
        try {
          newObject = modulejs.require(name).init(container);
        } catch(e) {
          console.log(e.message);
          newObject = void 0;
        }
        return newObject;
      };

      return ModulesInitializer;
    })();

    return ModulesInitializer;
  }
);
