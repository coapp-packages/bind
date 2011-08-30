rem This is the part of BuildAll.bat that actually builds things that matter.

perl makeversion.pl

cd ..
copy config.h.win32 config.h

mkdir Build
mkdir Build\Release

cd lib

cd isc\win32
nmake /nologo -f libisc.mak CFG="libisc - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd dns\win32
nmake /nologo -f gen.mak CFG="gen - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..
gen.exe -s . -t > include/dns/enumtype.h
gen.exe -s . -c > include/dns/enumclass.h
gen.exe -s . -i -P rdata/rdatastructpre.h -S rdata/rdatastructsuf.h > include/dns/rdatastruct.h
gen.exe -s . > code.h
cd win32
nmake /nologo -f libdns.mak CFG="libdns - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd isccfg\win32
nmake /nologo -f libisccfg.mak CFG="libisccfg - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd isccc\win32
nmake /nologo -f libisccc.mak CFG="libisccc - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd bind9\win32
nmake /nologo -f libbind9.mak CFG="libbind9 - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd lwres\win32
nmake /nologo -f liblwres.mak CFG="liblwres - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

rem This is the DLL required for the event Viewer

cd win32\bindevt
nmake /nologo -f bindevt.mak CFG="bindevt - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd ..

echo Now build the apps

cd bin

cd named\win32
nmake /nologo -f named.mak CFG="named - Win32 Release"  NO_EXTERNAL_DEPS="1"

cd ..\..

cd rndc\win32
nmake /nologo -f rndc.mak CFG="rndc - Win32 Release"  NO_EXTERNAL_DEPS="1"

cd ..\..

cd confgen\win32
nmake /nologo -f rndcconfgen.mak CFG="rndcconfgen - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f ddnsconfgen.mak CFG="ddnsconfgen - Win32 Release"  NO_EXTERNAL_DEPS="1"

cd ..\..

cd dig\win32
nmake /nologo -f dig.mak CFG="dig - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo /nologo -f host.mak CFG="host - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f nslookup.mak CFG="nslookup - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd nsupdate\win32
nmake /nologo -f nsupdate.mak CFG="nsupdate - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd check\win32
nmake /nologo -f namedcheckconf.mak CFG="namedcheckconf - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f namedcheckzone.mak CFG="namedcheckzone - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd dnssec\win32
nmake /nologo -f keygen.mak CFG="keygen - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f signzone.mak CFG="signzone - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f dsfromkey.mak CFG="dsfromkey - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f keyfromlabel.mak CFG="keyfromlabel - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f revoke.mak CFG="revoke - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f settime.mak CFG="settime - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd pkcs11\win32
nmake /nologo -f pk11keygen.mak CFG="pk11keygen - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f pk11list.mak CFG="pk11list - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f pk11destroy.mak CFG="pk11destroy - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..

cd tools\win32
nmake /nologo -f arpaname.mak CFG="arpaname - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f genrandom.mak CFG="genrandom - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f nsec3hash.mak CFG="nsec3hash - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f journalprint.mak CFG="journalprint - Win32 Release"  NO_EXTERNAL_DEPS="1"
nmake /nologo -f ischmacfixup.mak CFG="ischmacfixup - Win32 Release"  NO_EXTERNAL_DEPS="1"
cd ..\..
