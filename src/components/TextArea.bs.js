// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

function TextArea(Props) {
  var fontFamily = Props.fontFamily;
  var value = Props.value;
  var height = Props.height;
  var show = Props.show;
  var onFocusOpt = Props.onFocus;
  var onChange = Props.onChange;
  var onFocus = onFocusOpt !== undefined ? onFocusOpt : (function (param) {
        
      });
  var display = show !== undefined && show ? "block" : "none";
  var style = height !== undefined ? ({
        display: display,
        fontFamily: fontFamily,
        height: height
      }) : ({
        display: display,
        fontFamily: fontFamily
      });
  return React.createElement("textarea", {
              className: "text-area",
              style: style,
              value: value,
              onFocus: onFocus,
              onChange: onChange
            });
}

var make = TextArea;

export {
  make ,
  
}
/* react Not a pure module */