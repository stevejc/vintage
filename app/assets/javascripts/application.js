// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.Jcrop
//= require jquery.remotipart
//= require bootbox
//= require bootstrap-fileupload
//= require twitter/bootstrap
//= require_tree .

jQuery(function($) {

	// makes tr's clickable
	$("tr[data-link]").click(function() {
	  window.location = this.dataset.link
	});

	// function to activate twitter bootstrap loading button
	jQuery.fn.useLoadingButton = function() {
		$('#button').button();
		$('#button').click(function() {
		    $(this).button('loading');
		});
	}
	
	// activates twitter bootstrap popover functionality
	$('.popout').popover({ 
		html: true
  });  
 
})

myCustomConfirmBox = function(message, callback) {
  var options;
  options = [
    {
      'label': 'Yes, Definitely',
      'class': 'btn-danger',
      'callback': function() {
        if (typeof callback === 'function') {
          return callback();
        }
      }
    }, {
      'label': 'Opss! No',
      'class': 'btn-success'
    }
  ];
  return bootbox.dialog(message, options);
};
 
$.rails.allowAction = function(element) {
  var answer, callback, message;
  message = element.data("confirm");
  if (!message) {
    return true;
  }
  answer = false;
  callback = void 0;
  if ($.rails.fire(element, "confirm")) {
    myCustomConfirmBox(message, function() {
      var oldAllowAction;
      callback = $.rails.fire(element, "confirm:complete", [answer]);
      if (callback) {
        oldAllowAction = $.rails.allowAction;
        $.rails.allowAction = function() {
          return true;
        };
        element.trigger("click");
        return $.rails.allowAction = oldAllowAction;
      }
    });
  }
  return false;
};