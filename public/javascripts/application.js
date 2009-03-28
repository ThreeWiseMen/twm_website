// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//$("#shell").corner("32px");
//$("#shell .banner").corner("24px tl");

//$("#shell").corner();
//$("#shell .banner").corner();

function init() {

    $("#shell").corner({
        tl: { radius: 28 },
        tr: { radius: 28 },
        bl: { radius: 28 },
        br: { radius: 28 }
    });

    $("#shell .banner").corner({
        tl: { radius: 25 },
        tr: { radius: 25 }
    })

    $("#tech_logos").cycle();

}

