  #----------------#
## Makefile for Ark ##
  #----------------#

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Install directory
TARGET= $(shell echo $HOME)/.ark

# Ark input file and output file
ARK_O= ark
ARK_L= bin/ark

# Ark required module
LDEPS= deps/share/lua/5.4 # Directory to Lua Path
CDEPS= deps/lib/lua/5.4 # Directory to Lua C Path

M_ansicolorsx= $(LDEPS)/ansicolorsx.lua
M_argparse= $(LDEPS)/argparse.lua
M_rawterm= $(LDEPS)/rawterm.lua

M_cffi= $(CDEPS)/cffi.so
M_bit32= $(CDEPS)/bit32.so

ARK_M= $(M_ansicolorsx) $(M_argparse) $(M_rawterm) $(M_bit32) $(M_cffi)

# Luarocks configure flag
LR_CONF= --prefix=deps --lua-version=5.4 --with-lua-bin=deps/lua \
				 --with-lua-lib=deps/lua --with-lua-include=deps/lua

# Bin
LUA= deps/lua/lua
LUAROCKS= deps/bin/luarocks
LUASTATIC= deps/bin/luastatic

all: build

deps/lua:
	git submodule update --init --recursive

.PHONY: lua
lua: deps/lua
	+make -C deps/lua

.PHONY: luarocks
luarocks:
	deps/luarocks/configure $(LR_CONF)
	mv config.unix deps/luarocks/
	+make -C deps/luarocks
	+make install -C deps/luarocks

.PHONY: install-deps
install-deps:
	$(LUAROCKS) install --only-deps deps/arkdeps-deps-1.rockspec
