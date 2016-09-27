include config.mk

.SUFFIXES:
.SUFFIXES: .o .c

all: $(TARGET)

$(TARGET): $(OBJS)

.o:
	$(CC) $(LDFLAGS) $(OBJS) -o $(TARGET)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(TARGET) $(OBJS)

install: $(TARGET)
	mkdir -p $(PREFIX)/bin $(PREFIX)/share/man/man1
	cp $(TARGET) $(PREFIX)/bin
	cp $(TARGET).1 $(PREFIX)/share/man/man1
	chmod 755 $(PREFIX)/bin/$(TARGET)
	chmod 644 $(PREFIX)/share/man/man1/$(TARGET).1

uninstall:
	rm -f $(PREFIX)/bin/$(TARGET) $(PREFIX)/share/man/man1/$(TARGET).1

.PHONY: all clean install