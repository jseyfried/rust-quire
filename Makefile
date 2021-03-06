RUSTC:=rustc


all:
	cargo build

plain: libquire.rlib quire-tool


libquire.rlib: src/lib.rs src/*.rs
	$(RUSTC) -g -o $@ $<

test:
	cargo test

quire_test: src/lib.rs src/*.rs
	$(RUSTC) $< --test -g -o quire_test

rust-argparse/libargparse.rlib:
	make -C rust-argparse libargparse.rlib

quire-tool: quire-tool.rs rust-argparse/libargparse.rlib libquire.rlib
	$(RUSTC) $< -L . -L rust-argparse

.PHONY: test all plain
