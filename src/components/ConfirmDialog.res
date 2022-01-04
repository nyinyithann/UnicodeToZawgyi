open HeadlessUI

@react.component
let make = (~isOpen, ~onClose, ~delete) => {
  <Dialog _as="div" className="fixed inset-0 z-[100]" _open={isOpen} onClose={() => ()}>
    {({_open}) => {
      <div className="min-h-screen px-4 text-center bg-primary_600">
        <Dialog.Overlay className="fixed inset-0" />
        {/* This element is to trick the browser into centering the modal contents. */
        <span className="inline-block h-screen align-middle" ariaHidden=true />}
        <div
          className="inline-block w-[22rem] max-w-md p-6 overflow-hidden text-left align-middle transition-all transform shadow-md rounded-md bg-slate-50 mt-[-5rem]">
          <Dialog.Title className="text-lg font-medium leading-6 text-primary_900">
            {({_open}) => {"Deletion"->React.string}}
          </Dialog.Title>
          <div className="mt-2">
            <p className="text-sm text-gray-500">
              {"Are you sure to delete the text?"->React.string}
            </p>
          </div>
          <div className="flex mt-4 space-x-4">
            <button
              type_="button"
              className="inline-flex w-[5rem] justify-center px-4 py-2 text-sm font-medium text-slate-900 bg-slate-100 border border-transparent rounded-md hover:bg-slate-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:ring-red-500"
              onClick={e => {
                ReactEvent.Mouse.preventDefault(e)
                onClose()
              }}>
              {"Cancel"->React.string}
            </button>
            <button
              type_="button"
              className="inline-flex w-[5rem] justify-center px-4 py-2 text-sm font-medium text-blue-900 bg-blue-100 border border-transparent rounded-md hover:bg-blue-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:ring-blue-500"
              onClick={e => {
                ReactEvent.Mouse.preventDefault(e)
                delete()
                onClose()
              }}>
              {"Yes"->React.string}
            </button>
          </div>
        </div>
      </div>
    }}
  </Dialog>
}
