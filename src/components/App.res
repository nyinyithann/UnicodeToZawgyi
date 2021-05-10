let {string, useState} = module(React)

let unicodeSampleText = `༺ လယ်တီဆရာတော်ဘုရားကြီးရေးသားတော်မူသော ༻

  ☸ နိဗ္ဗိန္နတေးထပ် ☸
 ༺༻༺༻༺༻
အဝိဇ္ဇာ ပိတ်ကာဆို့၊
မိစ္ဆာမြို့ပြင်ပြင်၊
ဣဋ္ဌာလို့ ခင်မင်လျှင်၊
လွင့်စင်မည်မလွဲ၊
အရွတ်စု အပုတ်ကောင်ကို၊
အဟုတ်ယောင် မှားဖို့ ဖန်နဲ။

အသုဘ ရုပ်တစ္ဆေငယ်၊
မဟုတ်လေ ကိုယ်ထဲ၊
အပုပ်ရေ စိုတရွှဲဟာမို့၊
ယိုမစဲ သူ့မှာ၊
သွေးသည်းချေ ပြည် သလိပ်တွေက၊
တည်မဆိတ် လျှမ်းပြည့်သည်သာ၊

သို့ကလောက် ရွံစရာကို၊
လွန်တဏှာ မက်စွဲပါလို့၊
စက်ဝဲမှာတပေပေ၊
မွန်းကြပလေ၊
တဏှာဖမ်းတဲ့ အကန်းတွေမှာ၊
အပန်းမပြေ ဟိုက်မောရှာကြလေး။
တဏှာပူးတဲ့ အရူးတွေမှာ
အမူးမပြေ မိုက်မောရှာကြလေး။
တဏှာလိုက်တဲ့ အမိုက်တွေမှာ၊
အဟိုက်မပြေ ပင်ပန်းရှာကြလေး။`

module TextArea = {
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
}

let unicodeFontName = `"Noto Sans Myanmar","Pyidaungsu"`
let zawgyiFontName = "Noto Sans Zawgyi"

type tabType = [#Unicode | #Zawgyi]

let mobileHeight = "calc(100vh - 7.2em)"

let initialSelectedTab: tabType = #Unicode

let getLgLabelaClass = selected => {
  Js.String2.concat(
    selected ? "border-primary_200 text-primary_200" : "border-primary_500 text-primary_500",
    " " ++ "font-bold border-b-2 pb-1  inline self-start px-2 focus:outline-none",
  )
}

let getTabLabelClass = selected => {
  Js.String2.concat(
    selected
      ? "border-primary_200 text-primary_200"
      : "border-transparent text-primary_500 hover:text-primary_400 hover:border-primary_500",
    " " ++ "whitespace-nowrap py-2 px-1 border-b-2 font-bold",
  )
}

@react.component
let make = () => {
  let (theme, setTheme) = useState(_ => "theme-gray")
  let (unicodeText, setUnicodeText) = useState(_ => unicodeSampleText)
  let (zawgyiText, setZawgyiText) = useState(_ => Rabbit.uni2zg(unicodeSampleText))
  let (selectedTab, setSelectedTab) = useState(_ => initialSelectedTab)
  let (focusedLgTextArea, setFocusedLgTextArea) = useState(_ => initialSelectedTab)

  let handleUnicodeTextChange = e => {
    let newValue = ReactEvent.Form.target(e)["value"]
    setUnicodeText(_ => newValue)
    setZawgyiText(_ => Rabbit.uni2zg(newValue))
  }

  let handleZawgyiTextChange = e => {
    let newValue = ReactEvent.Form.target(e)["value"]
    setZawgyiText(_ => newValue)
    setUnicodeText(_ => Rabbit.zg2uni(newValue))
  }

  <div className={j`$theme h-screen`}>
    <div
      id="lg-screen"
      className="hidden 2xl:flex flex-row space-x-5 p-6  bg-primary_700 justify-between"
      style={ReactDOM.Style.make(~height="calc(100vh - 1.5em)", ())}>
      <div className="flex flex-col flex-1 space-y-4 self-stretch">
        <span className={getLgLabelaClass(focusedLgTextArea == #Unicode)}>
          {(#Unicode: tabType :> string)->string}
        </span>
        <TextArea
          fontFamily=unicodeFontName
          value=unicodeText
          show=true
          onFocus={e => setFocusedLgTextArea(_ => #Unicode)}
          onChange={handleUnicodeTextChange}
        />
      </div>
      <div className="flex flex-col flex-1 space-y-4 self-stretch">
        <span className={getLgLabelaClass(focusedLgTextArea == #Zawgyi)}>
          {(#Zawgyi: tabType :> string)->string}
        </span>
        <TextArea
          fontFamily=zawgyiFontName
          value=zawgyiText
          show=true
          onFocus={e => setFocusedLgTextArea(_ => #Zawgyi)}
          onChange={handleZawgyiTextChange}
        />
      </div>
    </div>
    <div id="non-lg-screen" className="2xl:hidden flex flex-col p-4 bg-primary_700">
      <div className="flex flex-row space-x-4">
        <a
          href="#"
          onClick={_ => setSelectedTab(_ => #Unicode)}
          className={getTabLabelClass(selectedTab == #Unicode)}>
          {(#Unicode: tabType :> string)->string}
        </a>
        <a
          href="#"
          onClick={_ => setSelectedTab(_ => #Zawgyi)}
          className={getTabLabelClass(selectedTab == #Zawgyi)}>
          {(#Zawgyi: tabType :> string)->string}
        </a>
        <div className="flex flex-row space-x-2 flex-1 justify-end">
          <Icons.Trash className="mobile-icon" onClick={_ => Js.log("test")} />
          <HLMenu as_="div" className="relative inline-block text-left">
            {({open_}) => {
              <>
                <HLMenu.Button className="mobile-icon">
                  <Icons.Copy
                    onClick={e => {
                      ReactEvent.Focus.preventDefault(e)
                      Js.log("test")
                    }}
                  />
                </HLMenu.Button>
                <HLMenu.Items
                  static=open_
                  as_="div"
                  className="flex flex-col origin-top-right absolute 
                  right-11 top-12 mt-4 w-40 p-1 bg-primary_600  
                  rounded divide-y divide-primary_200 focus:outline-none">
                  <HLMenu.Item>
                    {({active}) => {
                      <a
                        href=""
                        className="p-1 bg-primary_transparent text-primary_100 pl-5"
                        onClick={e => {
                          ReactEvent.Mouse.preventDefault(e)
                        }}>
                        {"Copy Unicode"->string}
                      </a>
                    }}
                  </HLMenu.Item>
                  <HLMenu.Item>
                    {({active}) => {
                      <a href="" className="p-1 bg-primary_transparent text-primary_100 pl-5">
                        {"Copy Zawgyi"->string}
                      </a>
                    }}
                  </HLMenu.Item>
                  <HLMenu.Item>
                    {({active}) => {
                      <a href="" className="p-1 bg-primary_transparent text-primary_100 pl-5">
                        {"Copy Both"->string}
                      </a>
                    }}
                  </HLMenu.Item>
                </HLMenu.Items>
              </>
            }}
          </HLMenu>
          <Icons.Settings
            className="mobile-icon"
            onClick={e => {
              ReactEvent.Focus.preventDefault(e)
              Js.log("test")
            }}
          />
        </div>
      </div>
      <div className="pt-4">
        <TextArea
          fontFamily=unicodeFontName
          value=unicodeText
          height=mobileHeight
          show={selectedTab == #Unicode}
          onChange={handleUnicodeTextChange}
        />
        <TextArea
          fontFamily=zawgyiFontName
          value=zawgyiText
          height=mobileHeight
          show={selectedTab == #Zawgyi}
          onChange={handleZawgyiTextChange}
        />
      </div>
    </div>
    <footer
      className="flex flex-row justify-between px-4 2xl:px-10 bg-primary_800 text-primary_400">
      <div className="flex-1 self-start">
        <a
          target="_blank"
          className="text-primary_200 underline"
          href="https://github.com/nyinyithann/UnicodeToZawgyi">
          {"GitHub Repo"->string}
        </a>
      </div>
      <div className="flex-1 self-end flex justify-end">
        <span>
          {"Credit: "->string}
          <a
            target="_blank"
            className="text-primary_200 underline"
            href="https://github.com/Rabbit-Converter/Rabbit">
            {"Rabbit"->string}
          </a>
        </span>
      </div>
    </footer>
  </div>
}
