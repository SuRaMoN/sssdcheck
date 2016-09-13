
Disclaimer
==========

DO NOT USE THIS UNLESS YOU USE SSSD VERSION LOWER THAN 1.14. In sssd v1.14 [sssctl](https://fedorahosted.org/sssd/wiki/DesignDocs/sssctl) is introduced with similar (better) functionality. This is only written for legacy versions.

About
=====

Bash script to check if LDAP component of sssd is still in online mode.
It ends quietly and successfully of sssd is still successfully connected with LDAP and it returns an exit code of 2 with an error message if for some reason sssd can no longer sync with LDAP.

Requirements and internal working
=================================

It needs the ldb-tools installed and a test linux user that's configured through LDAP. The script clears the cache for the specified user, queries sssd and checks if the cache is updated.

Usage
=====

Example:

```
    sssdcheck <TEST USER>
```

The test user parameter should be a linux username configured through LDAP.

Install instructions
====================

Make sure you have ldb-tools installed. It can be found in the repo of your favorite linux distribution (which is of course debian).

Just download the file sssdcheck and give it appropriate rights:
```
    wget "https://raw.githubusercontent.com/SuRaMoN/sssdcheck/master/sssdcheck"
    chmod a+x sssdcheck
```

You can also install it system wide by doing:
```
    git clone "https://github.com/SuRaMoN/sssdcheck.git"
    cd sssdcheck
    sudo make install
```


