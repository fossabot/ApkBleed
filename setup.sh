#!/bin/bash
echo "Setting Up Termux Java Repo By @ng1nx4O4"
pkg install gnupg -y &> /dev/null;
echo "deb http://ng1nx4o4.github.io/termux-java Hax4Us ng1nX4O4" > $PREFIX/etc/apt/sources.list.d/java.list
curl -s http://ng1nx4o4.github.io/termux-java/key.gpg | apt-key add -
echo "Updating APT Cache"
apt update &> /dev/null;
echo "Installing Requirements"
apt install javaos apktool signapk aapt -y &> /dev/null;
echo "Fixing Wrapper Script"
sed -i -e 's#'"-b /sdcard"'#'"-b /sdcard -b /storage"'#g' $(which apktool)
sed -i -e 's#'"-b /sdcard"'#'"-b /sdcard -b /storage"'#g' $(which signapk
sed -i -e 's#'"-b /sdcard"'#'"-b /sdcard -b /storage"'#g' $(which javaos)
mkdir -p $PREFIX/share/JavaOS/root/.bind
if [ -e $PREFIX/bin/msfconsole ]; then
	if [ -d $PREFIX/opt/metasploit-framework ]; then
		rm -rf $PREFIX/opt/metasploit-framework/lib/msf/core/payload/apk.rb
		mv apk${PREFIX}/opt/metasploit-framework/lib/msf/core/payload/apk.rb
	elif [ -d $HOME/metasploit-framework]; then
		rm -rf $HOME/metasploit-framework/lib/msf/core/payload/apk.rb
		mv apk $HOME/metasploit-framework/lib/msf/core/payload/apk.rb
	else
		echo "Metasploit Path Cannot Be Found"
		echo "Binding Will Not Work"
	fi
else
	echo "Metasploit Is Not Installed"
	echo "Binding Function Will Not Work"
fi
cp -rf apkbleed.sh $PREFIX/bin/apkbleed
chmod +x $PREFIX/bin/apkbleed
echo "Done !!!!!!!!!!"

