type menuRenderPropArg = {@as("open") open_: bool}

@module("@headlessui/react") @react.component
external make: (
  ~as_: string=?,
  ~children: menuRenderPropArg => React.element,
  ~className: string=?,
) => React.element = "Menu"

// type buttonRenderPropArg = {@as("open") open_: bool}

module Button = {
  @module("@headlessui/react") @scope("Menu") @react.component
  external make: (
    ~as_: string=?,
    ~children: React.element=?,
    ~className: string=?,
  ) => React.element = "Button"
}

// type itemsRenderPropArg = {@as("open") open_: bool}

module Items = {
  @module("@headlessui/react") @scope("Menu") @react.component
  external make: (
    ~as_: string=?,
    ~children: React.element=?,
    ~className: string=?,
    ~static: bool=?,
  ) => React.element = "Items"
}

type itemRenderPropArg = {active: bool, disabled: bool}
module Item = {
  @module("@headlessui/react") @scope("Menu") @react.component
  external make: (
    ~as_: string=?,
    ~children: itemRenderPropArg => React.element,
    ~className: string=?,
  ) => React.element = "Item"
}