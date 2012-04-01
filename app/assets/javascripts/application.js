// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){

	$("#buscar").live('keyup.autocomplete', function(){
    $(this).autocomplete( {
      source: "/movies/",
      select: function( event, ui ) {
        $("#movie_id").val(ui.item.id);
        $("#movie_name").val(ui.item.value);
      }
    })
  });

	$("#agregar").live('click', function(){
		$("#list").append("<tr><td>"+ $("#movie_name").val()+"</td><td><input type='text' value='1' size='1'></td></tr>")
		$("#buscar").val("")
	});

});
