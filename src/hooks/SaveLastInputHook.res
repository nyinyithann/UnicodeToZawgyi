let saveKey = "ZawgyiUnicodeConverter_SaveLastInput"

let useSaveLstInput = initialText => {
  open Dom.Storage2
  let (storedText, setStoredText) = React.useState(_ => {
    try {
      switch localStorage->getItem(saveKey) {
      | Some(v) => Js.String.length(v) == 0 ? initialText : v
      | None => initialText
      }
    } catch {
    | _ => initialText
    }
  })

  let saveText = text => {
    try {
      localStorage->setItem(saveKey, text)
      ignore(setStoredText(_prev => text))
    } catch {
    | Js.Exn.Error(e) =>
      switch Js.Exn.message(e) {
      | Some(msg) => Js.log(msg)
      | None => ()
      }
    }
  }

  (storedText, saveText)
}
