// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  var show_more = $(".show_more")
  var show_id = show_more.id;

  $(".show_more").click(function(){
  	console.log($(this).attr('id'))
  	$("#"+$(this).attr('id') + ".section_info").slideToggle("slow")
  
  });
});
