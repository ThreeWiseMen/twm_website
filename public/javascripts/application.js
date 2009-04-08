// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function page_init() {

    $("#shell").corner("13px");
    $("#shell .banner").corner("13px tl tr");
		// where is the mainpage panel rounding???? 
		$(".contentpaneldark").corner("11px bl br");
		
		document.getElementById("tech_logos").style.display='';
		document.getElementById("tech_logos").style.visibility='';
		
    $("#tech_logos").cycle();

}

