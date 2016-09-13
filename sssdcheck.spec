Name:           sssdcheck
Version:        $VERSION
Release:        1%{?dist}
Summary:        Clone of postmark for local installations

Group:          Development Tools
License:        none
URL:            https://github.com/SuRaMoN/sssdcheck
Source0:        sssdcheck-$VERSION.tar.gz

BuildRequires:  make
Requires:       ldb-tools

%description
Check if sssd is still connected to LDAP


%prep
%setup -q


%build
make %{?_smp_mflags}


%install
make install DESTDIR=$RPM_BUILD_ROOT BINDIR=%{_bindir}


%clean
make clean DESTDIR=$RPM_BUILD_ROOT BINDIR=%{_bindir}


%files
%defattr(-,root,root,-)
%{_bindir}/sssdcheck


%changelog
