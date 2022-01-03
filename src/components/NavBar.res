let {string} = module(React)

@react.component
let make = () => {
  <nav
    className="fixed h-12 inset-x-0 z-50 flex-1 px-2 shadow bg-primary_300 
    shadow-primary_200 dark:bg-slate-600 dark:text-white">
    <div className="flex items-center justify-between">
      <div className="flex md:space-x-2 p-2 pl-0 md:p-1 items-center justify-center">
        <div className="hidden md:flex mr-4 items-center justify-center font-myanmar_unicode">
          <span
            className="flex-auto text:lg md:text-2xl pt-2 font-bold text-center text-transparent bg-clip-text bg-gradient-to-r from-cyan-600 to-sky-500 dark:text-slate_400">
            {`မင်္ဂလာပါ`->string}
          </span>
        </div>
        <div className="flex items-center space-x-4 text-lg font-black font-navigation">
          <NavLink to="/" className="navbar-btn"> <span> {"Home"->string} </span> </NavLink>
          <NavLink to="/about" className="navbar-btn"> <span> {"About"->string} </span> </NavLink>
        </div>
      </div>
      <div className="relative flex items-center"> <ThemeMenu /> </div>
    </div>
  </nav>
}
