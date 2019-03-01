// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require vendor/jquery/jquery
//= require vendor/bootstrap/js/bootstrap.bundle
//= require vendor/jquery-easing/jquery.easing
//= require js/sb-admin-2
//= require vendor/datatables/jquery.dataTables.min.js
//= require vendor/datatables/dataTables.bootstrap4.min.js
//= require vendor/chart.js/Chart
//= require vendor/chart.js/Chart.bundle
//= require js/demo/chart-area-demo
//= require js/demo/chart-pie-demo
//= require custom
//= require bootstrap-datepicker

$(document).ready(function(){
  $('.datepicker').datepicker({format: 'yyyy-mm-dd'});
});