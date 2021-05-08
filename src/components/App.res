let {string, useState} = module(React)

module TextArea = {
  @react.component
  let make = (~fontFamily, ~value, ~onChange) => {
    <textarea
      style={ReactDOM.Style.make(~fontFamily, ())}
      value
      onChange
      className="p-4  rounded-md bg-primary_100 focus:outline-none  flex-1 shadow  subpixel-antialiased 
      leading-8 hover:shadow-md hover:bg-blend-lighten ring-1 focus:ring-primary_100 resize-none"
    />
  }
}

@react.component
let make = () => {
  let (theme, setTheme) = useState(_ => "theme-gray")
  let (unicodeText, setUnicodeText) = useState(_ =>
    `သီဟိုဠ်မှ ဉာဏ်ကြီးရှင်သည် အာယုဝဍ္ဎနဆေးညွှန်းစာကို ဇလွန်ဈေးဘေး ဗာဒံပင်ထက် အဓိဋ္ဌာန်လျက် ဂဃနဏဖတ်ခဲ့သည်။`
  )
  let (zawgyiText, setZawgyiText) = useState(_ =>
    `သီဟိုဠ္မွ ဉာဏ္ႀကီးရွင္သည္ အာယုဝၯနေဆးၫႊန္းစာကို ဇလြန္ေဈးေဘး ဗာဒံပင္ထက္ အဓိ႒ာန္လ်က္ ဂဃနဏဖတ္ခဲ့သည္။`
  )
  <div className=theme>
    <div className="flex flex-row space-x-5 p-10 pt-20 bg-primary_700 h-screen justify-between">
      <TextArea
        fontFamily="Noto Sans Myanmar"
        value=unicodeText
        onChange={e => setUnicodeText(_ => ReactEvent.Form.target(e)["value"])}
      />
      <TextArea
        fontFamily="Zawgyi-One"
        value=zawgyiText
        onChange={e => setZawgyiText(_ => ReactEvent.Form.target(e)["value"])}
      />
    </div>
  </div>
}
