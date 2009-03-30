#!/bin/bash

yuicompressor public/javascripts/jquery-1.3.2.min.js > public/javascripts/all.min.js
yuicompressor public/javascripts/jquery.cycle.all.min.js >> public/javascripts/all.min.js
yuicompressor public/javascripts/jquery.easing.1.3.js >> public/javascripts/all.min.js
#yuicompressor public/javascripts/jquery.qtip-1.0.0-beta3.1.min.js >> public/javascripts/all.min.js
yuicompressor public/javascripts/jquery.corner.js >> public/javascripts/all.min.js
yuicompressor public/javascripts/application.js >> public/javascripts/all.min.js

yuicompressor public/stylesheets/base.css > public/stylesheets/base.min.css

