// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function page_init() {

    (function($) {
      $.fn.randomize = function(childElem) {
        return this.each(function() {
          var $this = $(this);
          var elems = $this.children(childElem);
          elems.sort(function() { return (Math.round(Math.random())-0.5); });
          $this.empty();
          for(var i=0; i<elems.length; i++)
            $this.append(elems[i]);
        });
      }
    })(jQuery);

    if ($("#shell").length > 0) {
        $("#shell").corner("13px");
        if ($(".banner").length > 0)
            $("#shell .banner").corner("13px tl tr");

        if ($(".contentpaneldark").length > 0)
            $("#shell .contentpaneldark").corner("11px bl br");
    }

    if ($("#tech_logos").length > 0) {
        $("#tech_logos").randomize("img");
        $("#tech_logos").css('display', 'block');
        $("#tech_logos").cycle();
    }

    if ($("#quotes").length > 0) {
        $("#quotes").css('display', 'block');
        $("#quotes").cycle({
            timeout:  15000
        });
    }

/*
    if ($("#phone_dialog").length > 0) {
		$("#phone_dialog").dialog({
            title: "Give us a call!",
            width: 600,
			modal: true,
            autoOpen: false,
            hide: 'clip',
            show: 'clip',
            resizable: false,
            draggable: false,
			buttons: {
				Thanks: function() {
					$(this).dialog('close');
				}
			}
		});
    }
    $('strong.phone').click( function () {
        if ($("#phone_dialog").length > 0) {
            $("#phone_dialog").dialog('open');
        }
    }).css('cursor', 'help');
*/

    $('A[rel="external"]').click( function() {
        var w = window.open( $(this).attr('href') );
        if (w) {
            if (w.focus) w.focus();
            return false;
        }
        w = null;
        return true;
    });

}
