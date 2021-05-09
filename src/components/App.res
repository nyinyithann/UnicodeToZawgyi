let {string, useState} = module(React)

module TextArea = {
  @react.component
  let make = (
    ~fontFamily,
    ~value,
    ~height=?,
    ~show=?,
    ~onFocus = (_:ReactEvent.Focus.t) => (),
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
    <textarea style value onChange onFocus className="text-area" />
  }
}

let unicodeFontName = "Noto Sans Myanmar"
let zawgyiFontName = "Zawgyi-One"

let unicodeSampleText = `သီဟိုဠ်မှ ဉာဏ်ကြီးရှင်သည် အာယုဝဍ္ဎနဆေးညွှန်းစာကို ဇလွန်ဈေးဘေး ဗာဒံပင်ထက် အဓိဋ္ဌာန်လျက် ဂဃနဏဖတ်ခဲ့သည်။`
let zawgyiSampleText = `သီဟိုဠ္မွ ဉာဏ္ႀကီးရွင္သည္ အာယုဝၯနေဆးၫႊန္းစာကို ဇလြန္ေဈးေဘး ဗာဒံပင္ထက္ အဓိ႒ာန္လ်က္ ဂဃနဏဖတ္ခဲ့သည္။`

type tabType = [#Unicode | #Zawgyi]

let mobileHeight = "calc(100vh - 12em)"

let initialSelectedTab: tabType = #Unicode

@react.component
let make = () => {
  let (theme, setTheme) = useState(_ => "theme-green")
  let (unicodeText, setUnicodeText) = useState(_ => unicodeSampleText)
  let (zawgyiText, setZawgyiText) = useState(_ => zawgyiSampleText)
  let (selectedTab, setSelectedTab) = useState(_ => initialSelectedTab)
  let (focusedLgTextArea, setFocusedLgTextArea) = useState(_ => initialSelectedTab)

  <div className=theme>
    <div
      className="hidden 2xl:flex flex-row space-x-5 p-10 pt-12 bg-primary_700 h-screen justify-between">
      <div className="flex flex-col flex-1 space-y-4">
        <span
          className={Js.String2.concat(
            focusedLgTextArea == #Unicode
              ? "border-primary_200 text-primary_200"
              : "border-primary_500 text-primary_500",
            " " ++ "font-bold border-b-2 pb-1  inline self-start px-2",
          )}>
          {(#Unicode: tabType :> string)->string}
        </span>
        <TextArea
          fontFamily=unicodeFontName
          value=unicodeText
          show=true
          onFocus={e => setFocusedLgTextArea(_ => #Unicode)}
          onChange={e => setUnicodeText(_ => ReactEvent.Form.target(e)["value"])}
        />
      </div>
      <div className="flex flex-col flex-1 space-y-4">
        <span
          className={Js.String2.concat(
            focusedLgTextArea == #Zawgyi
              ? "border-primary_200 text-primary_200"
              : "border-primary_500 text-primary_500",
            " " ++ "font-bold border-b-2 pb-1  inline self-start px-2",
          )}>
          {(#Zawgyi: tabType :> string)->string}
        </span>
        <TextArea
          fontFamily=zawgyiFontName
          value=zawgyiText
          show=true
          onFocus={e => setFocusedLgTextArea(_ => #Zawgyi)}
          onChange={e => setZawgyiText(_ => ReactEvent.Form.target(e)["value"])}
        />
      </div>
    </div>
    <div className="2xl:hidden flex flex-col p-10 pt-20 bg-primary_700 h-screen ">
      <div className="space-x-10 pb-2">
        <a
          href="#"
          onClick={_ => setSelectedTab(_ => #Unicode)}
          className={Js.String2.concat(
            selectedTab == #Unicode
              ? "border-primary_200 text-primary_200"
              : "border-transparent text-primary_500 hover:text-primary_400 hover:border-primary_500",
            " " ++ "whitespace-nowrap py-2 px-1 border-b-2 font-bold",
          )}>
          {(#Unicode: tabType :> string)->string}
        </a>
        <a
          href="#"
          onClick={_ => setSelectedTab(_ => #Zawgyi)}
          className={Js.String2.concat(
            selectedTab == #Zawgyi
              ? "border-primary_200 text-primary_200"
              : "border-transparent text-primary_500 hover:text-primary_400 hover:border-primary_500",
            " " ++ "whitespace-nowrap py-2 px-1 border-b-2 font-bold",
          )}>
          {(#Zawgyi: tabType :> string)->string}
        </a>
      </div>
      <div className="pt-4">
        <TextArea
          fontFamily=unicodeFontName
          value=unicodeText
          height=mobileHeight
          show={selectedTab == #Unicode}
          onChange={e => setUnicodeText(_ => ReactEvent.Form.target(e)["value"])}
        />
        <TextArea
          fontFamily=zawgyiFontName
          value=zawgyiText
          height=mobileHeight
          show={selectedTab == #Zawgyi}
          onChange={e => setZawgyiText(_ => ReactEvent.Form.target(e)["value"])}
        />
      </div>
    </div>
  </div>
}
