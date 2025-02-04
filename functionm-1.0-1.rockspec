package = "functionM"
version = "1.0-1"
source = {
   url = "git+https://github.com/4ngelf/lua-functionM"
}
description = {
   summary = "Relative require function.",
   detailed = [[
Relative require function. This is a function to make lua module management
a little bit nicer. Inspired in python's `from ... import ...` syntax, this
is a function that allows to load modules with a relative path.]],
   homepage = "https://github.com/4ngelf/lua-functionM.git",
   license = "MIT"
}
dependencies = {
    "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      function_M = "lua/function_M.lua"
   }
}
