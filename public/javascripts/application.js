// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//$("#shell").corner("32px");
//$("#shell .banner").corner("24px tl");

//$("#shell").corner();
//$("#shell .banner").corner();

function init() {

    $("#shell").corner({
        tl: { radius: 32 },
        tr: { radius: 32 },
        bl: { radius: 32 },
        br: { radius: 32 }
    });

    $("#shell .banner").corner({
        tl: { radius: 28 },
        tr: { radius: 28 }
    })

    $("#tech_logos").cycle();

}

