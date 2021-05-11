 @react.component
  let make = (
    ~fontFamily,
    ~value,
    ~height=?,
    ~show=?,
    ~onFocus=(_: ReactEvent.Focus.t) => (),
    ~onChange,
  ) => {
    let display = switch show {
    | Some(true) => "block"
    | _ => "none"
    }
    let style = switch height {
    | Some(h) => ReactDOM.Style.make(~fontFamily, ~height=h, ~display, ())
    | None => ReactDOM.Style.make(~fontFamily, ~display, ())
    }
    <textarea className="text-area" style value onChange onFocus />
  }