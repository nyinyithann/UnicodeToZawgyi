type toggleStatus = Single | Double

let actionBtnDefaultStyle = `action-btn dark:hover:text-slate_100 dark:hover:bg-slate-300 dark:active:bg-primary_50`

@react.component
let make = (~className: option<string>=?, ~toggleStatus: toggleStatus, ~onClick) => {
  let cn = switch className {
  | Some(c) => j`$actionBtnDefaultStyle $c`
  | None => actionBtnDefaultStyle
  }

  <button type_="button" className={cn} onClick>
    {toggleStatus == Single
      ? <SingleIcon className="h-full w-full" fillColor="var(--color-primary-600)" />
      : <DoubleIcon className="h-full w-full" fillColor="var(--color-primary-600)" />}
  </button>
}
