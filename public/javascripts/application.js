// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function page_init() {

    $("#shell").corner("28px");
    $("#shell .banner").corner("22px tl tr");
		$(".contentpaneldark").corner("22px bl br");
		
		document.getElementById("tech_logos").style.display='';
		document.getElementById("tech_logos").style.visibility='';
		
    $("#tech_logos").cycle();

}

