CFLAGS =
LDFLAGS = /usr/lib64/librpm.so.1

TARGET = rpmvercmp
OFILES = rpmvercmp.o

$(TARGET): $(OFILES)

*.o: 

clean:
	rm -f *.o

check: $(TARGET)
	test x"`./$(TARGET) 1 2`" = x"-1"
	test x"`./$(TARGET) 1 1`" = x"0"
	test x"`./$(TARGET) 2 1`" = x"1"
	  ./$(TARGET) 1 1 '='
	! ./$(TARGET) 1 1 '<'
	  ./$(TARGET) 1 1 '<='
	! ./$(TARGET) 1 1 '>'
	  ./$(TARGET) 1 1 '>='
	! ./$(TARGET) 2 1 '='
	! ./$(TARGET) 2 1 '<'
	! ./$(TARGET) 2 1 '<='
	  ./$(TARGET) 2 1 '>'
	  ./$(TARGET) 2 1 '>='
	! ./$(TARGET) 1 2 '='
	  ./$(TARGET) 1 2 '<'
	  ./$(TARGET) 1 2 '<='
	! ./$(TARGET) 1 2 '>'
	! ./$(TARGET) 1 2 '>='
