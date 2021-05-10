// My 2 favourite ways to use icons from HeroIcons package.

@module("@heroicons/react/solid") external getCopyIcon: _ => React.element = "ClipboardCopyIcon"
@module("@heroicons/react/solid") external getTrashIcon: _ => React.element = "TrashIcon"
@module("@heroicons/react/solid") external getAdjustmentsIcon: _ => React.element = "AdjustmentsIcon"

module Trash = {
   @react.component
  let make = (~className=?, ~onClick=?) => {
    getTrashIcon({"className": className, "onClick": onClick})
  }
}

module Copy = {
  @react.component
  let make = (~className=?, ~onClick=?) => {
    getCopyIcon({"className": className, "onClick": onClick})
  }
}

module Settings = {
  @react.component
  let make = (~className=?, ~onClick=?) => {
    getAdjustmentsIcon({"className": className, "onClick": onClick})
  }
}

