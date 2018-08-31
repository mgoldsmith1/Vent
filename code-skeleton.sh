#!/bin/sh

# This is just a code skeleton for now

#Checking Version of ?
if type -p java; then
    echo found java executable in PATH
    _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo found java executable in JAVA_HOME     
    _java="$JAVA_HOME/bin/java"
else
    echo "no java"
fi

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo version "$version"
    
    if [[ "$version" > "1.8" ]] && [[ "$version" < "1.9" ]]; then
         echo Your Version of ? is more than ? but less than ?
         echo No need to Upgrade... Skipping Installation Step
         echo ? has already been installed.
         echo INSTALLED.
	 #Running Application
	 #echo Running Application... 
	 #./run.sh
    elif [[ "$version" > "1.9" ]]; then        
         echo Your Version of ? is greater than ?
         
	 #Running Application
	 #echo Running Application...
	 #./run.sh
    else 
 	 echo Your Version of ? is less than ?
	 echo Upgrading to ?...

	 #With Homebrew we will install Java 8
	 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	 brew update
	# brew tap caskroom/cask
	# brew cask install caskroom/versions/java8

         echo INSTALLED.
	
    fi
fi
