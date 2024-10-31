# Makefile for Proxy Lab
#
# You may modify this file any way you like (except for the handin
# rule). You instructor will type "make" on your specific Makefile to
# build your proxy from sources.

# Makefile for Proxy Lab

CC = gcc
CFLAGS = -g -Wall
LDFLAGS = -lpthread

all: proxy echoClient echoServer

csapp.o: csapp.c csapp.h
	$(CC) $(CFLAGS) -c csapp.c

proxy.o: proxy.c csapp.h cache.h
	$(CC) $(CFLAGS) -c proxy.c

cache.o: cache.c cache.h csapp.h
	$(CC) $(CFLAGS) -c cache.c

proxy: proxy.o csapp.o cache.o
	$(CC) $(CFLAGS) proxy.o csapp.o cache.o -o proxy $(LDFLAGS)

# Corrected echoClient.o and echoServer.o rules
echoClient.o: echoClient.c csapp.h
	$(CC) $(CFLAGS) -c echoClient.c

echoClient: echoClient.o csapp.o
	$(CC) $(CFLAGS) echoClient.o csapp.o -o echoClient $(LDFLAGS)

echoServer.o: echoServer.c csapp.h
	$(CC) $(CFLAGS) -c echoServer.c

echoServer: echoServer.o csapp.o
	$(CC) $(CFLAGS) echoServer.o csapp.o -o echoServer $(LDFLAGS)

# handin rule (do not modify)
handin:
	(make clean; cd ..; tar cvf $(USER)-proxylab-handin.tar proxylab-handout --exclude tiny --exclude nop-server.py --exclude proxy --exclude driver.sh --exclude port-for-user.pl --exclude free-port.sh --exclude ".*")

clean:
	rm -f *~ *.o proxy echoClient echoServer core *.tar *.zip *.gzip *.bzip *.gz

