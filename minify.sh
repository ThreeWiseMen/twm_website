#!/bin/bash

YUI=~/bin/yuicompressor

$YUI public/javascripts/jquery-1.3.2.min.js > public/javascripts/all.min.js
$YUI public/javascripts/jquery-ui-1.7.1.custom.min.js >> public/javascripts/all.min.js
$YUI public/javascripts/jquery.cookie.js >> public/javascripts/all.min.js
$YUI public/javascripts/jquery.cycle.all.min.js >> public/javascripts/all.min.js
#$YUI public/javascripts/jquery.easing.1.3.js >> public/javascripts/all.min.js
#$YUI public/javascripts/jquery.qtip-1.0.0-beta3.1.min.js >> public/javascripts/all.min.js
$YUI public/javascripts/jquery.corner.js >> public/javascripts/all.min.js
$YUI public/javascripts/application.js >> public/javascripts/all.min.js

$YUI public/stylesheets/base.css > public/stylesheets/all.min.css
$YUI public/stylesheets/jquery-ui-1.7.1.custom.css >> public/stylesheets/all.min.css
