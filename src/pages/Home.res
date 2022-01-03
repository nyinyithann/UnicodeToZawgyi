@set external setValue: (Dom.element, string) => unit = "value"
@get external getValue: Dom.element => string = "value"

type textAreaType = Zawgyi | Unicode

let {string, useState, useRef, useEffect0} = module(React)
let zawgyiText = `စာရုိက္ရန္`

@react.component
let make = () => {
  let zawgyiInputRef = useRef(Js.Nullable.null)
  let unicodeInputRef = useRef(Js.Nullable.null)

  let (selectedTextArea, setSelectedTextArea) = useState(_ => Zawgyi)

  let (zawgyiBtnStyle, unicodeBtnStyle) = {
    let (x, y) = ("tab-btn border-b-2 border-primary_700", "tab-btn")
    switch selectedTextArea {
    | Zawgyi => (x, y)
    | Unicode => (y, x)
    }
  }

  let (zawgyiTextAreaStyle, unicodeTextAreaStyle) = {
    let (x, y) = ("w-full h-full p-[0.8rem] pt-0", "hidden h-full p-[0.8rem] pt-0")
    switch selectedTextArea {
    | Zawgyi => (x, y)
    | Unicode => (y, x)
    }
  }

  useEffect0(() => {
    switch zawgyiInputRef.current->Js.Nullable.toOption {
    | Some(input) => input->setValue(zawgyiText)
    | None => ()
    }
    switch unicodeInputRef.current->Js.Nullable.toOption {
    | Some(input) => input->setValue(Converter.zg2uni(zawgyiText))
    | None => ()
    }
    None
  })

  let handleZawgyiBtnClick = e => {
    ReactEvent.Mouse.preventDefault(e)
    setSelectedTextArea(_ => Zawgyi)
  }

  let handleUnicodeBtnClick = e => {
    ReactEvent.Mouse.preventDefault(e)
    setSelectedTextArea(_ => Unicode)
  }

  let handleZawgyiTextChange = e => {
    let value = ReactEvent.Form.target(e)["value"]
    switch unicodeInputRef.current->Js.Nullable.toOption {
    | Some(input) => input->setValue(Converter.zg2uni(value))
    | None => ()
    }
  }

  let handleUnicodeTextChange = e => {
    let value = ReactEvent.Form.target(e)["value"]
    switch zawgyiInputRef.current->Js.Nullable.toOption {
    | Some(input) => input->setValue(Converter.uni2zg(value))
    | None => ()
    }
  }

  <div className="flex flex-col flex-nowrap h-[calc(100vh-3rem)] w-full">
    <div className="flex flex-nowrap w-full h-10 items-end bg-white">
      <div className="flex px-3 pb-1 space-x-2 items-end font-secondary">
        <button type_="button" className={zawgyiBtnStyle} onClick={handleZawgyiBtnClick}>
          {`Zawgyi`->string}
        </button>
        <button type_="button" className={unicodeBtnStyle} onClick={handleUnicodeBtnClick}>
          {`Unicode`->string}
        </button>
      </div>
      <ActionBar className="flex p-1 pr-3 space-x-2 justify-end ml-auto w-36" />
    </div>
    <div className="flex h-[calc(100vh-5.5rem)]">
      <div className={zawgyiTextAreaStyle}>
        <textarea
          className="text-area w-full font-myanmar_zawgyi"
          ref={ReactDOM.Ref.domRef(zawgyiInputRef)}
          onChange={handleZawgyiTextChange}
        />
      </div>
      <div className={unicodeTextAreaStyle}>
        <textarea
          className="text-area w-full font-myanmar_unicode"
          ref={ReactDOM.Ref.domRef(unicodeInputRef)}
          onChange={handleUnicodeTextChange}
        />
      </div>
    </div>
  </div>
}
