# openjdk-7-locale-fail
Debian OpenJDK7 fails in Currency.getInstance(Locale.getDefault()) - IllegalArgumentException

Given that system environment has LANG=C.UTF-8 it seems that on some systems:

a) Java Runtime gets country = C
b) java.lang.Currency.getInstance() throws IllegalArgumentException, because country code lenght < 2

This happens on debian and ubuntu linux.

This happens with OpenJDK7 and Oracle JDK 8

So far I have not been able to reproduce this on OSX 10.10.5 with java version "1.7.0_71"
 o It seems that Java runtime replaces the system LANG on that platform
