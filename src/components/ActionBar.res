@react.component
let make = (~className=?) => {
  <div ?className>
    <TrashButton className="h-8 w-8" onClick={e => Js.log(ReactEvent.Mouse.target(e))} />
    <CopyMenuButton
      className="h-8 w-8"
      onCopyZawgyiText={e => Js.log(ReactEvent.Mouse.target(e))}
      onCopyUnicodeText={e => Js.log(ReactEvent.Mouse.target(e))}
      onCopyBoth={e => Js.log(ReactEvent.Mouse.target(e))}
    />
    <LayoutToggleButton
      className="hidden md:block h-8 w-8"
      toggleStatus={LayoutToggleButton.Single}
      onClick={e => Js.log(ReactEvent.Mouse.target(e))}
    />
  </div>
}
