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

  var ids = []
  var values = []
  var movie = []
  var stocks = []
  var count = -1 

	$("#buscar").live('keyup.autocomplete', function(){
    $(this).autocomplete( {
      source: "/movies/",
      appendTo: '#menu-container',
      select: function( event, ui ) {
        $("#movie_id").val(ui.item.id);
        $("#movie_name").val(ui.item.value);
        $("#agregar").attr('disabled', false);
        $("#retornar").attr('disabled', false);
        $("#find").attr('disabled', false);

      }
    })
  });

	$("#agregar").live('click', function(){
    ids.push($("#movie_id").val())
    values.push($("#movie_name").val())
		$("#list").append("<tr value="+ $("#movie_id").val() +"><td>"+ $("#movie_name").val()+"</td><td><input id='stock' type='text' value='1' size='1'></td></tr> ")
		$("#buscar").val("")
    $("#agregar").attr('disabled', 'disabled');
    $(".button_add").attr('disabled', false);
    console.log(ids);


	});

  $("#retornar").live('click', function(){
    $.ajax({
      url: '/returns',
      type: "POST",
      data: {id: $("#movie_id").val()},
      dataType: "json",
      complete: function(data) {
        alert('Pelicula cambiaba correctamente');
        window.location.href = 'new'
      }
    });

  });

  // $('#newspaper-b tr').live('click', function(){
  //    $(this).remove();
  //   return false;
  // });


  $(".button_add").live('click', function(){
    $('#newspaper-b tr').each(function(item) {

      if ($(this).find("#stock").val() != null) {
        console.log($(this).find("#stock").val())
        stocks.push($(this).find("#stock").val()) 
      };

    });

    $.ajax({
      url: '/sales',
      type: "POST",
      data: {ids: ids,
            stocks: stocks},
      dataType: "json",
      beforeSend: function() {
        
      },
      complete: function(data) {
        alert('Peliculas vendidas correctamente');
        console.log(data)
        window.location.href = 'new'
      }
    });
  });

  $("#find").live('click', function(){
    
    $.ajax({
      url: '/movies/'+ $("#movie_id").val()+'/edit',
      data: {find: true},
      type: "GET",
      success: function(data){
        console.log(data)
        $("#buscar").val("")
        $("#find").attr('disabled', 'disabled');
        $('tbody').html('<tr><td>'+data.title_esp+'</td><td>'+data.title_eng+'</td><td>'+data.stock+'</td><td><a href="/movies/'+data.id+'/edit">Editar</a></td></tr>')

      }

    });
  });



  $("#plus").live('click', function(){
    alert("Pelicula agregada correctamente")

  });

  $("#edit").live('click', function(){
    alert("Pelicula editada correctamente")

  });

});
