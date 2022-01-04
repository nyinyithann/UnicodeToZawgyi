/*
let {string, useState} = module(React)

let unicodeSampleText = `တောင်တောရယ်သာ၊ မာလာကငုံဖူး၊ ပင်ဝါးရုံလေယူတိမ်းတယ်၊ ကျေးငှက်ကမြူး`

type tabType = [#Unicode | #Zawgyi]

let unicodeFontName = `"Noto Sans Myanmar","Pyidaungsu"`
let zawgyiFontName = "Noto Sans Zawgyi"

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
  let (zawgyiText, setZawgyiText) = useState(_ => Converter.uni2zg(unicodeSampleText))
  let (selectedTab, setSelectedTab) = useState(_ => initialSelectedTab)
  let (focusedLgTextArea, setFocusedLgTextArea) = useState(_ => initialSelectedTab)

  let handleUnicodeTextChange = e => {
    let newValue = ReactEvent.Form.target(e)["value"]
    setUnicodeText(_ => newValue)
    setZawgyiText(_ => Converter.uni2zg(newValue))
  }

  let handleZawgyiTextChange = e => {
    let newValue = ReactEvent.Form.target(e)["value"]
    setZawgyiText(_ => newValue)
    setUnicodeText(_ => Converter.zg2uni(newValue))
  }

  let deleteText = _ => {
    setUnicodeText(_ => " ")->ignore
    setZawgyiText(_ => " ")->ignore
  }

  let copyUnicodeText = e => {
    ReactEvent.Mouse.preventDefault(e)
    Util.copy(unicodeText)
  }

  let copyZawgyiText = e => {
    ReactEvent.Mouse.preventDefault(e)
    Util.copy(zawgyiText)->ignore
  }

  let copyBothText = e => {
    ReactEvent.Mouse.preventDefault(e)
    Util.copy(unicodeText ++ "\n\r" ++ zawgyiText)->ignore
  }

  let menu = (kind: [#mb | #lg]) => {
    open HeadlessUI
    let cn = "flex flex-col origin-top-right absolute mt-4 w-40 p-1 bg-primary_600 rounded divide-y divide-primary_200 focus:outline-none"
    let (copyClassName, colorClassName) = switch kind {
    | #mb => (cn ++ " right-11 top-12", cn ++ " right-8 top-12")
    | #lg => (cn ++ " right-4 top-6", cn ++ " right-1 top-6")
    }
    <div className="flex flex-row space-x-2 flex-1 justify-end">
      <Icons.Trash className="mobile-icon" onClick={deleteText} />
      <Menu as_="div" className="relative inline-block text-left">
        {({open_}) => {
          <>
            <Menu.Button className="mobile-icon">
              <Icons.Copy
                onClick={e => {
                  ReactEvent.Focus.preventDefault(e)
                }}
              />
            </Menu.Button>
            <Menu.Items static=open_ as_="div" className=copyClassName>
              <Menu.Item>
                {_ => {
                  <a href="" className="copy-menu-item" onClick={copyUnicodeText}>
                    {"Copy Unicode"->string}
                  </a>
                }}
              </Menu.Item>
              <Menu.Item>
                {_ => {
                  <a href="" className="copy-menu-item" onClick={copyZawgyiText}>
                    {"Copy Zawgyi"->string}
                  </a>
                }}
              </Menu.Item>
              <Menu.Item>
                {_ => {
                  <a href="" className="copy-menu-item" onClick={copyBothText}>
                    {"Copy Both"->string}
                  </a>
                }}
              </Menu.Item>
            </Menu.Items>
          </>
        }}
      </Menu>
      <Menu as_="div" className="relative inline-block text-left">
        {({open_}) => {
          <>
            <Menu.Button className="mobile-icon">
              <Icons.Settings
                onClick={e => {
                  ReactEvent.Focus.preventDefault(e)
                }}
              />
            </Menu.Button>
            <Menu.Items static=open_ as_="div" className=colorClassName>
              <Menu.Item>
                {_ => {
                  <>
                    <div className="flex flex-col">
                      <div className="theme-menu-internal-div">
                        <button
                          type_="button"
                          className="theme-btn"
                          style={ReactDOM.Style.make(~background="#6B7280", ())}
                          onClick={_ => setTheme(_ => "theme-gray")}
                        />
                        <button
                          type_="button"
                          className="theme-btn"
                          style={ReactDOM.Style.make(~background="#EF4444", ())}
                          onClick={_ => setTheme(_ => "theme-red")}
                        />
                        <button
                          type_="button"
                          className="theme-btn"
                          style={ReactDOM.Style.make(~background="#3B82F6", ())}
                          onClick={_ => setTheme(_ => "theme-blue")}
                        />
                        <button
                          type_="button"
                          className="theme-btn"
                          style={ReactDOM.Style.make(~background="#F59E0B", ())}
                          onClick={_ => setTheme(_ => "theme-yellow")}
                        />
                      </div>
                      <div className="theme-menu-internal-div">
                        <button
                          type_="button"
                          className="theme-btn"
                          style={ReactDOM.Style.make(~background="#10B981", ())}
                          onClick={_ => setTheme(_ => "theme-green")}
                        />
                        <button
                          type_="button"
                          className="theme-btn"
                          style={ReactDOM.Style.make(~background="#6366F1", ())}
                          onClick={_ => setTheme(_ => "theme-indigo")}
                        />
                        <button
                          type_="button"
                          className="theme-btn"
                          style={ReactDOM.Style.make(~background="#8B5CF6", ())}
                          onClick={_ => setTheme(_ => "theme-purple")}
                        />
                        <button
                          type_="button"
                          className="theme-btn"
                          style={ReactDOM.Style.make(~background="#EC4899", ())}
                          onClick={_ => setTheme(_ => "theme-pink")}
                        />
                      </div>
                    </div>
                  </>
                }}
              </Menu.Item>
            </Menu.Items>
          </>
        }}
      </Menu>
    </div>
  }

  <div className={j`$theme h-screen`}>
    <div
      id="lg-screen"
      className="hidden 2xl:flex flex-row space-x-5 p-6 bg-primary_700 justify-between"
      style={ReactDOM.Style.make(~height="calc(100vh - 1.5em)", ())}>
      <div className="flex flex-col flex-1 space-y-4 self-stretch">
        <div className="flex flex-row relative">
          <span className={getLgLabelaClass(focusedLgTextArea == #Unicode)}>
            {(#Unicode: tabType :> string)->string}
          </span>
          {menu(#lg)}
        </div>
        <TextArea
          fontFamily=unicodeFontName
          value=unicodeText
          show=true
          onFocus={e => setFocusedLgTextArea(_ => #Unicode)}
          onChange={handleUnicodeTextChange}
        />
      </div>
      <div className="flex flex-col flex-1 space-y-4 self-stretch">
        <div className="flex flex-row relative">
          <span className={getLgLabelaClass(focusedLgTextArea == #Zawgyi)}>
            {(#Zawgyi: tabType :> string)->string}
          </span>
          {menu(#lg)}
        </div>
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
        {menu(#mb)}
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
    /* <footer */
    /* className="flex flex-row justify-between px-4 2xl:px-10 bg-primary_800 text-primary_400"> */
    /* <div className="flex-1 self-start"> */
    /* <a */
    /* target="_blank" */
    /* className="text-primary_200 underline" */
    /* href="https://github.com/nyinyithann/UnicodeToZawgyi"> */
    /* {"GitHub Repo"->string} */
    /* </a> */
    /* </div> */
    /* <div className="flex-1 self-end flex justify-end"> */
    /* <span> */
    /* {"Credit: "->string} */
    /* <a */
    /* target="_blank" */
    /* className="text-primary_200 underline" */
    /* href="https://github.com/Rabbit-Converter/Rabbit"> */
    /* {"Rabbit"->string} */
    /* </a> */
    /* </span> */
    /* </div> */
    /* </footer> */
  </div>
}
*/