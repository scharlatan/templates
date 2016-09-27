include config.mk

all: install

install: $(TARGET)
	mkdir -p $(PREFIX)/bin $(PREFIX)/share/man/man1
	cp $(TARGET) $(PREFIX)/bin
	cp $(TARGET:=.1) $(PREFIX)/share/man/man1
	cd $(PREFIX)/bin/ && chmod 755 $(TARGET)
	cd $(PREFIX)/share/man/man1 && chmod 644 $(TARGET:=.1)

uninstall:
	cd $(PREFIX)/bin && rm -f $(TARGET)
	cd $(PREFIX)/share/man/man1/ && rm -f $(TARGET:=.1)

.PHONY: all install uninstall