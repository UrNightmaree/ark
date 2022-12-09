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

# Lua deps
M_ansicolorsx= $(LDEPS)/ansicolorsx.lua
M_argparse= $(LDEPS)/argparse.lua
M_rawterm= $(LDEPS)/rawterm.lua

# C deps
M_cffi= $(CDEPS)/cffi.so
M_bit32= $(CDEPS)/bit32.so

# Combine
ARK_M= $(M_ansicolorsx) $(M_argparse) $(M_rawterm) $(M_bit32) $(M_cffi)

# Luarocks configure flag
LR_CONF= --prefix=deps --lua-version=5.4 --with-lua-bin=deps/lua \
				 --with-lua-lib=deps/lua --with-lua-include=deps/lua

all: build

deps/lua:
	git submodule update --init --recursive

.PHONY: mklua
mklua: deps/lua
	+make -C deps/lua

.PHONY: mkluarocks
mkluarocks: deps/lua
	deps/luarocks/configure $(LR_CONF)
	+make -C deps/luarocks
	+make -C deps/luarocks install
