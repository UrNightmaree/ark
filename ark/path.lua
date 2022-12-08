-------------------------------------------------------------------------
-- A Lua module for monkey patching `package.path` and `package.cpath` --
--                                                                     --
-- Part of the Ark project (https://github.com/UrNightmaree/ark)       --
-------------------------------------------------------------------------

local ARK_SHAREDIR = os.getenv "_ARK_SHAREDIR"

--              v ARK_SHAREDIR can contain nil value
local lpath = (ARK_SHAREDIR or "") .. "/lua"
local cpath = (ARK_SHAREDIR or "") .. "/c"

package.path = (lpath ~= "/lua" and lpath .. ";" or "") .. package.path
package.cpath = (cpath ~= "/c" and cpath .. ";" or "") .. package.cpath
