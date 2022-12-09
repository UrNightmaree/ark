-------------------------------------------------------------------------
-- A Lua module for monkey patching `package.path` and `package.cpath` --
--                                                                     --
-- Part of the Ark project (https://github.com/UrNightmaree/ark)       --
-------------------------------------------------------------------------

local ARK_SHAREDIR = os.getenv "_ARK_SHAREDIR" or ""

--              v ARK_SHAREDIR can contain nil value
local lpath = ARK_SHAREDIR .. "/lua/?.lua;" .. ARK_SHAREDIR .. "/lua/?/init.lua"
local cpath = ARK_SHAREDIR .. "/c/?.so"

package.path = (lpath ~= "/lua/?.lua;/lua/?/init.lua" and lpath .. ";" or "") .. package.path
package.cpath = (cpath ~= "/c/?.so" and cpath .. ";" or "") .. package.cpath

--print(package.path)
--print(package.cpath)
