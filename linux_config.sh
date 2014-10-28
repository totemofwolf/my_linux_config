#!/bin/bash

set -x

shell_dir=$(cd `dirname $0`; pwd);

if [ -f $shell_dir/.bashrc.pwh ]; then
	ln -sf $shell_dir/.bashrc.pwh ~/.bashrc.pwh
fi

if [ -d $shell_dir/.vim ]; then
	ln -sf $shell_dir/.vim ~
fi

if [ -f $shell_dir/.vimrc ]; then
	ln -sf $shell_dir/.vimrc ~/.vimrc
fi

if [ `whoami` == "root" ]; then
	if [ -f $shell_dir/hosts ] && [ -n "`diff /etc/hosts $shell_dir/hosts`" ]; then
		ln -sf $shell_dir/hosts /etc/hosts
	fi
	
	if [ -n "`grep -i kali /etc/issue`" ] && [ -f $shell_dir/sources.list.kali ] && [ -n "`diff /etc/apt/sources.list $shell_dir/sources.list.kali`" ]; then
		ln -sf $shell_dir/sources.list.kali /etc/apt/sources.list
	fi
fi

# set my bashrc
if [ -n ~/.bashrc ]; then
	touch ~/.bashrc
fi

if [ -z "`grep -i .bashrc.pwh ~/.bashrc`" ]; then
cat <<EOF >> ~/.bashrc

# my bashrc
if [ -f ~/.bashrc.pwh ]; then
	. ~/.bashrc.pwh
fi

EOF
fi

. ~/.bashrc

# end

