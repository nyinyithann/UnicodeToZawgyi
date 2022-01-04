module Menu = {
  type menuRenderPropArg = {@as("open") open_: bool}
  @module("@headlessui/react") @react.component
  external make: (
    ~as_: string=?,
    ~children: menuRenderPropArg => React.element,
    ~className: string=?,
  ) => React.element = "Menu"

  module Button = {
    @module("@headlessui/react") @scope("Menu") @react.component
    external make: (
      ~as_: string=?,
      ~children: React.element=?,
      ~className: string=?,
    ) => React.element = "Button"
  }

  module Items = {
    @module("@headlessui/react") @scope("Menu") @react.component
    external make: (
      ~as_: string=?,
      ~children: React.element=?,
      ~className: string=?,
      ~static: bool=?,
    ) => React.element = "Items"
  }

  module Item = {
    type itemRenderPropArg = {active: bool, disabled: bool}
    @module("@headlessui/react") @scope("Menu") @react.component
    external make: (
      ~as_: string=?,
      ~children: itemRenderPropArg => React.element,
      ~className: string=?,
    ) => React.element = "Item"
  }
}

module Dialog = {
  type renderProps = {@as("open") _open: bool}
  @module("@headlessui/react") @react.component
  external make: (
    ~_open: bool=?,
    ~onClose: unit => unit=?,
    ~initialFocus: React.ref<React.element>=?,
    ~_as: 'asType=?,
    ~static: bool=?,
    ~unmount: bool=?,
    ~children: renderProps => React.element,
    ~className: string=?,
  ) => React.element = "Dialog"

  module Overlay = {
    type renderProps = {@as("open") _open: bool}
    @module("@headlessui/react") @react.component @scope("Dialog")
    external make: (
      ~_as: 'asType=?,
      ~children: renderProps => React.element=?,
      ~className: string=?,
    ) => React.element = "Overlay"
  }

  module Title = {
    type renderProps = {@as("open") _open: bool}
    @module("@headlessui/react") @react.component @scope("Dialog")
    external make: (
      ~_as: 'asType=?,
      ~className: string=?,
      ~children: renderProps => React.element,
    ) => React.element = "Title"
  }

  module Description = {
    type renderProps = {@as("open") _open: bool}
    @module("@headlessui/react") @react.component @scope("Dialog")
    external make: (
      ~_as: 'asType=?,
      ~className: string=?,
      ~children: renderProps => React.element,
    ) => React.element = "Description"
  }
}
