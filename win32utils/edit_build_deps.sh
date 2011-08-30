#!/bin/sh

# The current VC build is complicated and requires modifying an bunch of
# tracked files during the build process, a no-no for us. And most importantly,
# It leaves out the include path for libiconv.

# So the idea behind this is to make the changes we need once and commit them.

for file in $(git ls-files |grep '\.mak$'); do
	root_dir=$(echo $file|sed -e 's/[^/]//g'|sed -e 's,/,../,g')
	root_parent=${root_dir}..
	root_parent_exp=$(echo ${root_parent}|sed -e 's,\.,\\.,g')

	sed -e 's,/I "'${root_parent_exp}'[^"]*" ,,g' -i ${file}

	sed -e 's,^\(CPP_PROJ\|CPP_SWITCHES\)=,\1=/I "'${root_parent}'/libxml2/include" /I "'${root_parent}'/libiconv/include" /I "'${root_parent}'/openssl/include" ,g' -i ${file}

	sed -e 's,^LIBXML=.*$,LIBXML='${root_parent}'/libxml2/win32/bin.msvc/libxml2.dll,g' -i ${file}
done
