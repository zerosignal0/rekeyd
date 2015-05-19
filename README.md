# rekeyd
Golang client daemon for Hashicorp Vault https://www.vaultproject.io/

The daemon's purpose is to apply credential changes that occur inside Vault in pseudo-realtime to applications that are not directly integrated.

Initial Features:

* Ask user for initial credentials to connect to Vault - mlock self pages
* Precisely manage memory existence of said creds.  When done connecting - garbage collect them.
* On a configurable interval, long poll Vault for monitored credentials
* When a monitored credential changes, run a series of associated system commands to apply the new credentials
* Embrace go get, go build, go install in-place
* Be cross platform

