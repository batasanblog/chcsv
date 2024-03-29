#
PROGRAM = chcsv
OBJS = chcsv.o sqlda.o Option.o OutPut.o Signal.o
CC = gcc
LDFLAGS = -lclntsh

#
$(PROGRAM):	$(OBJS)
	gcc -o $(PROGRAM) $(OBJS) -L ${ORACLE_HOME}/lib $(LDFLAGS)
#
.SUFFIXES: .pc .c .o

#
.c.o:
	gcc  -c $< -I ${ORACLE_HOME}/precomp/public -I ${ORACLE_HOME}/sdk/include
#
.pc.c:
	proc iname=$<

#
.PHONY: clean
clean:
	$(RM) $(PROGRAM) $(OBJS)

#
