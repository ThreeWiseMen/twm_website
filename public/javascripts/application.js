// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function page_init() {

    if ($("#shell").length > 0) {
        $("#shell").corner("13px");
        if ($(".banner").length > 0)
            $("#shell .banner").corner("13px tl tr");

        if ($(".contentpaneldark").length > 0)
            $("#shell .contentpaneldark").corner("11px bl br");
    }

    if ($("#tech_logos").length > 0) {
        $("#tech_logos").css('display', 'block');
        $("#tech_logos").cycle();
    }

    if ($("#quotes").length > 0) {
        $("#quotes").css('display', 'block');
        $("#quotes").cycle({
            timeout:  10000,
        });
    }

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

    $('A[rel="external"]').click( function() {
        var w = window.open( $(this).attr('href') );
        if (w) {
            if (w.focus) w.focus();
            return false;
        }
        w = null;
        return true;
    });

    $('strong.phone').click( function () {
        if ($("#phone_dialog").length > 0) {
            $("#phone_dialog").dialog('open');
        }
    }).css('cursor', 'help');
}
