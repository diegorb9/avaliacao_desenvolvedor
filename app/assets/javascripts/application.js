//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require bootstrap-notify
//= require paper-dashboard
//= require jquery.remotipart

function notify(message, type){
  $.notify({
  	message: message
  },{
  	type: type,
    animate: {
  		enter: 'animated fadeInDown',
  		exit: 'animated fadeOutUp'
  	}
  });
}
