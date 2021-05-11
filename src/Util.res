type doc
type body
type element
type style

@val external document: doc = "document"
@send external createElement: (doc, string) => element = "createElement"
@get external getBody: doc => body = "body"
@send external appendChild: (body, element) => unit = "appendChild"
@set external setValue: (element, string) => unit = "value"
@get external getStyle: element => style = "style"
@set external setPosition: (style, string) => unit = "position"
@send external focus: element => unit = "focus"
@send external select: element => unit = "select"
@send external execCommand: (doc, string) => unit = "execCommand"
@send external removeChild: (body, element) => unit = "removeChild"

let copy = (text: string) => {
  let textArea: element = document->createElement("textarea")
  textArea->setValue(text)
  textArea->getStyle->setPosition("fixed")
  document->getBody->appendChild(textArea)
  textArea->focus
  textArea->select
  try {
    document->execCommand("copy")
  } catch {
  | Js.Exn.Error(obj) =>
    switch Js.Exn.message(obj) {
    | Some(m) => Js.log("Copy error " ++ m)
    | None => ()
    }
  }
  document->getBody->removeChild(textArea)
}
