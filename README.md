# function `M(...)`

Relative require function. This is a function to make lua module management
a little bit nicer. Inspired in python's `from ... import ...` syntax, this
is a function that allows to load modules with a relative path.

# Usage

First, make the function available on global scope:
```lua
-- In entry point (init.lua)
-- Just require it into global space
M = require("function_M").get_M(require)
```

With this project structure as example:
```
lua/
  foo/
    another.lua
    bar/
      init.lua
      baz.lua
    init.lua
```

You can now declare a module and use require(...) relative to that module:
```lua
-- lua/foo/bar.lua
-- At file top, use the current module path as an argument:
local M = M(...)
-- Or hardcoded
local M = M("foo.bar")

-- Now you can make relative requires
local baz = M.require("baz") -- is require("foo.bar.baz")
local baz = M.require(".baz") -- is require("foo.bar.baz") too
local foo = M.require("..") -- is require("foo")
local another = M.require("..another") -- is require("foo.another")
local self = M.require("") -- is require("foo.bar")
local self = M.require(".") -- is require("foo.bar") too
local self = M.require("...foo.bar") -- is also require("foo.bar")

-- It only includes require(...) function to M so you can use M as a
-- normal module
function M.some_function() end
M.some_number = 123

return M
```

# Caveats

If you declare `M(...)` with a module path different from the current
module, you will get unexpected results.

```lua
-- In module "foo.bar"
local M = M("foo")

-- This will return module "foo.baz", not module "foo.bar.baz"
baz = M.require("baz")
```
