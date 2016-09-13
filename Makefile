
.PHONY: rpm get-deps-ubuntu rpm-build-deps-centos rpm-build-deps-ubuntu install clean
DESTDIR = /
BINDIR=/usr/bin
VERSION = 1.0.1
UBUNTU_PACKAGES = rpm make bash git sed
NAME=sssdcheck
SPECFILE=$(NAME).spec

default:
	echo Run "make rpm" to build the rpm or "make install" to install $(NAME)

rpm: rpm-build-deps-ubuntu
	cd ~ && mkdir -p ~/rpmbuild/SPECS ~/rpmbuild/SOURCES
	tar --exclude=build --transform 's/^\./$(NAME)-$(VERSION)/' -cf ~/rpmbuild/SOURCES/$(NAME)-$(VERSION).tar.gz .
	sed -e 's/\$$VERSION/$(VERSION)/' $(SPECFILE) > ~/rpmbuild/SPECS/$(SPECFILE)
	rpmbuild $$(cat /etc/issue | grep -q CentOS || echo --nodeps) -ba ~/rpmbuild/SPECS/$(SPECFILE)

get-deps-ubuntu:
	sudo apt-get install re2c

rpm-build-deps-centos:
	sudo yum install rpmdevtools rpmlint make bash git sed

rpm-build-deps-ubuntu:
	if grep -q "Ubuntu" /etc/issue && [ "$$(dpkg-query -W -f='$${status}' $(UBUNTU_PACKAGES) 2>&1 | sed 's/install ok installed//g')" != "" ]; then \
		echo sudo apt-get install $(UBUNTU_PACKAGES); \
		sudo apt-get install $(UBUNTU_PACKAGES); \
	fi

install:
	mkdir -p $(DESTDIR)$(BINDIR)
	cp -a sssdcheck $(DESTDIR)$(BINDIR)/sssdcheck

clean:
	rm -f $(DESTDIR)$(BINDIR)/sssdcheck

