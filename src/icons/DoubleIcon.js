// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Caml_option from "rescript/lib/es6/caml_option.js";

function DoubleIcon(Props) {
  var className = Props.className;
  var fillColor = Props.fillColor;
  var tmp = {
    height: "24",
    width: "24",
    preserveAspectRatio: "xMidYMid meet",
    version: "1.0",
    viewBox: "0 0 24.000000 24.000000",
    xmlns: "http://www.w3.org/2000/svg"
  };
  if (className !== undefined) {
    tmp.className = Caml_option.valFromOption(className);
  }
  return React.createElement("svg", tmp, React.createElement("g", {
                  fill: fillColor,
                  stroke: "none",
                  transform: "translate(0.000000,24.000000) scale(0.006977,-0.006977)"
                }, React.createElement("path", {
                      d: "M1535 3043 c-403 -32 -717 -109 -975 -238 -95 -48 -120 -70 -149\n-135 -19 -42 -21 -65 -21 -362 l0 -318 69 0 68 0 6 40 c8 64 51 126 110 160\nl52 30 390 0 c357 0 393 -2 430 -19 72 -33 119 -93 131 -170 l7 -41 67 0 67 0\n7 41 c12 77 59 137 131 170 37 17 73 19 430 19 l390 0 52 -30 c59 -34 102 -96\n110 -160 l6 -40 68 0 69 0 0 311 c0 338 -3 364 -53 425 -55 66 -306 174 -547\n234 -277 70 -655 104 -915 83z m185 -143 c14 0 67 3 119 6 110 7 156 -3 206\n-47 51 -45 68 -101 63 -206 -4 -70 -10 -99 -32 -141 -31 -60 -141 -180 -232\n-253 -59 -46 -65 -49 -122 -49 -56 0 -64 3 -119 44 -85 64 -208 196 -239 258\n-22 42 -28 71 -32 139 -5 97 6 143 46 191 47 56 92 69 212 63 58 -3 116 -5\n130 -5z"
                    }), React.createElement("path", {
                      d: "M207 1769 c-47 -27 -47 -29 -47 -679 0 -643 0 -643 44 -679 22 -18\n54 -4 77 32 14 24 19 51 19 105 l0 72 1420 0 1420 0 0 -72 c0 -138 75 -195\n126 -97 22 43 21 1237 -1 1279 -34 66 -93 56 -116 -20 l-12 -40 -1417 0 -1417\n0 -12 40 c-6 21 -21 46 -34 55 -25 18 -26 18 -50 4z"
                    })));
}

var make = DoubleIcon;

export {
  make ,
  
}
/* react Not a pure module */