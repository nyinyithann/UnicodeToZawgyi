@react.component
let make = (~className=?, ~toggleState: Types.toggleState, ~onDelete, ~onCopy, ~onToggle) => {
  <div ?className>
    <TrashButton
      className="h-8 w-8"
      onClick={e => {
        ReactEvent.Mouse.preventDefault(e)
        onDelete()
      }}
    />
    <CopyMenuButton
      className="h-8 w-8"
      onCopyZawgyiText={e => {
        ReactEvent.Mouse.preventDefault(e)
        onCopy(Types.ZawgyiText)
      }}
      onCopyUnicodeText={e => {
        ReactEvent.Mouse.preventDefault(e)
        onCopy(Types.UnicodeText)
      }}
      onCopyBoth={e => {
        ReactEvent.Mouse.preventDefault(e)
        onCopy(Types.BothText)
      }}
    />
    <LayoutToggleButton
      className="hidden md:block h-8 w-8"
      toggleState
      onClick={e => {
        ReactEvent.Mouse.preventDefault(e)
        onToggle()
      }}
    />
  </div>
}
