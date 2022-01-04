// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as ColorSwatchIcon from "../icons/ColorSwatchIcon.js";
import * as React$1 from "@headlessui/react";
import * as ThemeSwitchProvider from "../providers/ThemeSwitchProvider.js";

function string(prim) {
  return prim;
}

function ThemeMenu$ColorButton(Props) {
  var color = Props.color;
  var theme = Props.theme;
  var onClick = Props.onClick;
  return React.cloneElement(React.createElement("button", {
                  "aria-label": "color",
                  className: "p-1 rounded-full h-8 w-8 flex items-center justify-center\n        focus:ring-1 hover:ring-1 focus:outline-none ring-slate-400/50",
                  style: {
                    backgroundColor: color
                  },
                  type: "button",
                  onClick: onClick
                }), {
              "data-theme": theme
            });
}

var ColorButton = {
  make: ThemeMenu$ColorButton
};

var themeList = [
  [
    {
      color: "#94A3B8",
      theme: "theme-slate"
    },
    {
      color: "#9CA3AF",
      theme: "theme-gray"
    },
    {
      color: "#A1A1AA",
      theme: "theme-zinc"
    },
    {
      color: "#A3A3A3",
      theme: "theme-neutral"
    }
  ],
  [
    {
      color: "#A8A29E",
      theme: "theme-stone"
    },
    {
      color: "#F87171",
      theme: "theme-red"
    },
    {
      color: "#FB923C",
      theme: "theme-orange"
    },
    {
      color: "#FBBF24",
      theme: "theme-amber"
    }
  ],
  [
    {
      color: "#FACC15",
      theme: "theme-yellow"
    },
    {
      color: "#A3E635",
      theme: "theme-lime"
    },
    {
      color: "#4ADE80",
      theme: "theme-green"
    },
    {
      color: "#34D399",
      theme: "theme-emerald"
    }
  ],
  [
    {
      color: "#2DD4BF",
      theme: "theme-teal"
    },
    {
      color: "#22D3EE",
      theme: "theme-cyan"
    },
    {
      color: "#38BDF8",
      theme: "theme-sky"
    },
    {
      color: "#60A5FA",
      theme: "theme-blue"
    }
  ],
  [
    {
      color: "#818CF8",
      theme: "theme-indigo"
    },
    {
      color: "#A78BFA",
      theme: "theme-violet"
    },
    {
      color: "#C084FC",
      theme: "theme-purple"
    },
    {
      color: "#E879F9",
      theme: "theme-fuchsia"
    }
  ],
  [
    {
      color: "#F472B6",
      theme: "theme-pink"
    },
    {
      color: "#FB7185",
      theme: "theme-rose"
    },
    {
      color: "#000000",
      theme: "dark"
    }
  ]
];

function ThemeMenu(Props) {
  var setTheme = React.useContext(ThemeSwitchProvider.themeSwitchContext);
  var clickHandler = React.useCallback((function (e) {
          e.preventDefault();
          return Curry._1(setTheme, e.target.getAttribute("data-theme"));
        }), [setTheme]);
  return React.createElement(React$1.Menu, {
              as_: "div",
              children: (function (param) {
                  return React.createElement(React.Fragment, undefined, React.createElement(React$1.Menu.Button, {
                                  children: React.createElement(ColorSwatchIcon.make, {
                                        className: "self-center w-6 h-6 text-primary_700 dark:text-white"
                                      }),
                                  className: "flex flex-col items-center self-end justify-center\n          flex-auto w-8 h-8 rounded-full border-primary_transparent \n          hover:bg-primary_400 active:bg-primary_400\n          active:text-primary_500 text-primary_600 focus:outline-none\n          hover:text-primary_700 dark:hover:bg-slate-500"
                                }), React.createElement(React$1.Menu.Items, {
                                  as_: "div",
                                  children: React.createElement(React$1.Menu.Item, {
                                        children: (function (param) {
                                            return React.createElement("div", {
                                                        className: "z-10 flex flex-col"
                                                      }, Belt_Array.mapWithIndex(themeList, (function (i, x) {
                                                              return React.createElement("div", {
                                                                          key: "theme_div_" + i,
                                                                          className: "p-2 flex flex-1 flex-row\n                    gap-3 justify-start items-center"
                                                                        }, Belt_Array.map(x, (function (param) {
                                                                                var color = param.color;
                                                                                return React.createElement(ThemeMenu$ColorButton, {
                                                                                            color: color,
                                                                                            theme: param.theme,
                                                                                            onClick: clickHandler,
                                                                                            key: color
                                                                                          });
                                                                              })));
                                                            })));
                                          })
                                      }),
                                  className: "flex flex-col origin-top-right absolute mt-4 z-[100]\n          w-[12rem] rounded w-40 p-1 right-1 top-[1.2rem] border-[1px] shadow-lg\n          border-primary_200 bg-primary_200 focus:outline-none dark:bg-slate-600\n          dark:border-slate-500"
                                }));
                }),
              className: "relative flex items-center text-left"
            });
}

var make = ThemeMenu;

export {
  string ,
  ColorButton ,
  themeList ,
  make ,
  
}
/* react Not a pure module */