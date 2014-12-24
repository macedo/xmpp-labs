
//= require jquery
//= require underscore
//= require backbone
//= require bootstrap
//= require modulejs
//= require modules
//= require modules_initializer

$(function() {
  var ModulesInitializer = modulejs.require("ModulesInitializer");
  ModulesInitializer.init();
});
