let {string} = module(React)

let actionBtnDefaultStyle = `action-btn dark:hover:text-slate_100 dark:hover:bg-slate-300 dark:active:bg-primary_50`

@react.component
let make = (~className: option<string>=?, ~onCopyZawgyiText, ~onCopyUnicodeText, ~onCopyBoth) => {
  open HeadlessUI
  let cn = switch className {
  | Some(c) => j`$actionBtnDefaultStyle $c`
  | None => actionBtnDefaultStyle
  }
  <Menu as_="div" className="relative inline-block text-left">
    {({open_}) => {
      <>
        <Menu.Button className={cn}>
          <div role="button" onClick={e => ReactEvent.Mouse.preventDefault(e)}>
            <CopyIcon className="h-full w-full" fillColor="var(--color-primary-600)" />
          </div>
        </Menu.Button>
        <Menu.Items
          static=open_
          as_="div"
          className="flex flex-col absolute right-[0.9rem] md:right-[3.2rem] top-[5.4rem] md:top-[5.7rem] origin-top-right w-40 px-2 bg-white border-[1px] border-primary_400 rounded divide-y divide-primary_500 focus:outline-none shadow text-primary_900">
          <Menu.Item className="copy-menu-item dark:text-slate-900 dark:hover:text-gray-700">
            {_ => {
              <a href="" onClick={onCopyUnicodeText}> {"Copy Unicode"->string} </a>
            }}
          </Menu.Item>
          <Menu.Item className="copy-menu-item dark:text-slate-900 dark:hover:text-gray-700">
            {_ => {
              <a href="" onClick={onCopyZawgyiText}> {"Copy Zawgyi"->string} </a>
            }}
          </Menu.Item>
          <Menu.Item className="copy-menu-item dark:text-slate-900 dark:hover:text-gray-700">
            {_ => {
              <a href="" onClick={onCopyBoth}> {"Copy Both"->string} </a>
            }}
          </Menu.Item>
        </Menu.Items>
      </>
    }}
  </Menu>
}
