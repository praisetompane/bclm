prefix ?= /usr/local
bindir = $(prefix)/bin

build:
	swift build -c release --disable-sandbox --arch x86_64
	strip .build/release/bclm

install: build
	mkdir -p "$(bindir)"
	install ".build/release/bclm" "$(bindir)"

uninstall:
	rm -rf "$(bindir)/bclm"

test:
	swift build -c debug --build-tests
	sudo swift test --skip-build

clean:
	rm -rf .build

.PHONY: build install uninstall clean
