let {string, useState, useRef, useEffect0, useEffect2} = module(React)

let zawgyiText = `ငါဟာ ေရာက္ၿပီးသားေတြ ျပန္ျပန္ေရာက္ေနတယ္
ငါဟာ ျဖစ္ၿပီးသားေတြ ျပန္ျပန္ျဖစ္ေနတယ္
ငါဟာ တိုင္ပတ္ေနတယ္
ငါဟာ ရြာလည္ေနတယ္။
ဒါဟာ ကမၻာႀကီး လိေမၼာ္သီးကဲ့သို႔
လံုး၀န္းေနေၾကာင္း၊ လံုးေၾကာင္း
ေသခ်ာေရရာေအာင္
ငါေျပာႏိုင္ခဲ့တာပဲ။ ။
(ေအာင္ခ်ိမ့္)`

open Types
open WebApi

@react.component
let make = () => {
  let zawgyiInputRef = useRef(Js.Nullable.null)
  let unicodeInputRef = useRef(Js.Nullable.null)

  let (storedText, saveText) = SaveLastInputHook.useSaveLstInput(zawgyiText)
  let (isOpenDialog, setOpenDialog) = useState(_ => false)
  let (selectedTextArea, setSelectedTextArea) = useState(_ => Zawgyi)
  let (toggleState, setToggleState) = useState(_ => Single)

  let (zawgyiBtnStyle, unicodeBtnStyle) = {
    let (x, y) = ("tab-btn border-b-2 border-primary_700", "tab-btn")
    switch selectedTextArea {
    | Zawgyi => (x, y)
    | Unicode => (y, x)
    }
  }

  let (zawgyiTextAreaStyle, unicodeTextAreaStyle) = {
    switch toggleState {
    | Single =>
      let (x, y) = (
        "w-full h-full p-[0.6rem] md:px-[0.6rem] pt-[0.1rem]",
        "invisible md:hidden w-0",
      )
      switch selectedTextArea {
      | Zawgyi => (x, y)
      | Unicode => (y, x)
      }
    | Double => (
        "w-1/2 h-full p-[0.8rem] md:pl-[0.8rem] md:pr-[0.1rem] pt-[0.1rem]",
        "w-1/2 h-full p-[0.8rem] md:pl-[0.1rem] md:pr-[0.6rem] pt-[0.1rem]",
      )
    }
  }

  useEffect0(() => {
    switch zawgyiInputRef.current->Js.Nullable.toOption {
    | Some(input) => input->setValue(storedText)
    | None => ()
    }
    switch unicodeInputRef.current->Js.Nullable.toOption {
    | Some(input) => input->setValue(Converter.zg2uni(storedText))
    | None => ()
    }
    let id = Js.Global.setInterval(() => {
      switch zawgyiInputRef.current->Js.Nullable.toOption {
      | Some(input) => input->getValue->saveText
      | None => ()
      }
    }, 5000)

    Some(() => Js.Global.clearInterval(id))
  })

  useEffect2(() => {
    switch selectedTextArea {
    | Zawgyi =>
      switch zawgyiInputRef.current->Js.Nullable.toOption {
      | Some(input) => input->focus
      | None => ()
      }
    | Unicode =>
      switch unicodeInputRef.current->Js.Nullable.toOption {
      | Some(input) => input->focus
      | None => ()
      }
    }
    None
  }, (selectedTextArea, toggleState))

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

  let handleZawgyiTextFocus = e => {
    ReactEvent.Focus.preventDefault(e)
    setSelectedTextArea(_ => Zawgyi)
  }

  let handleUnicodeTextChange = e => {
    let value = ReactEvent.Form.target(e)["value"]
    switch zawgyiInputRef.current->Js.Nullable.toOption {
    | Some(input) => input->setValue(Converter.uni2zg(value))
    | None => ()
    }
  }

  let handleUnicodeTextFocus = e => {
    ReactEvent.Focus.preventDefault(e)
    setSelectedTextArea(_ => Unicode)
  }

  let onDelete = () => setOpenDialog(_ => true)

  let delete = () => {
    switch zawgyiInputRef.current->Js.Nullable.toOption {
    | Some(input) => input->setValue("")
    | None => ()
    }
    switch unicodeInputRef.current->Js.Nullable.toOption {
    | Some(input) => input->setValue("")
    | None => ()
    }
  }

  let onCopy = (copyContent: Types.copyContent) => {
    open Types
    let getZawgyiText = () => {
      switch zawgyiInputRef.current->Js.Nullable.toOption {
      | Some(input) => input->getValue
      | None => ""
      }
    }
    let getUnicodeText = () => {
      switch unicodeInputRef.current->Js.Nullable.toOption {
      | Some(input) => input->getValue
      | None => ""
      }
    }
    switch copyContent {
    | ZawgyiText => getZawgyiText()->Util.copy
    | UnicodeText => getUnicodeText()->Util.copy
    | BothText => (getZawgyiText() ++ "\n\r" ++ getUnicodeText())->Util.copy
    }
  }

  let onToggle = () => {
    setToggleState(prev => prev == Single ? Double : Single)
  }

  <div className="flex flex-col flex-nowrap h-[calc(100vh-6.2rem)] md:h-[calc(100vh-3rem)] w-full">
    <div className="flex flex-nowrap w-full h-10 items-end bg-white">
      <div className="flex px-3 pb-1 space-x-2 items-end font-secondary">
        <button type_="button" className={zawgyiBtnStyle} onClick={handleZawgyiBtnClick}>
          {`Zawgyi`->string}
        </button>
        <button type_="button" className={unicodeBtnStyle} onClick={handleUnicodeBtnClick}>
          {`Unicode`->string}
        </button>
      </div>
      <ActionBar
        className="flex p-1 pr-3 space-x-2 justify-end ml-auto w-36"
        toggleState
        onDelete
        onCopy
        onToggle
      />
    </div>
    <div className="flex h-[calc(100vh-5.5rem)] space-x-1">
      <div className={zawgyiTextAreaStyle}>
        <textarea
          spellCheck=false
          className="text-area w-full font-myanmar_zawgyi"
          ref={ReactDOM.Ref.domRef(zawgyiInputRef)}
          onChange={handleZawgyiTextChange}
          onFocus={handleZawgyiTextFocus}
        />
      </div>
      <div className={unicodeTextAreaStyle}>
        <textarea
          spellCheck=false
          className="text-area w-full font-myanmar_unicode"
          ref={ReactDOM.Ref.domRef(unicodeInputRef)}
          onChange={handleUnicodeTextChange}
          onFocus={handleUnicodeTextFocus}
        />
      </div>
    </div>
    <ConfirmDialog isOpen={isOpenDialog} onClose={() => setOpenDialog(_ => false)} delete />
  </div>
}
