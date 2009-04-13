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

}

