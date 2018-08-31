#!/bin/sh

# This is just a code skeleton for now

#Checking Version of ?
if type -p temp; then
    echo found java executable in PATH
    _temp=temp
elif [[ -n "$?" ]] && [[ -x "$?/bin/?" ]];  then
    echo found ? executable in ?_HOME     
    _?="$?_HOME/bin/?"
else
    echo "no ?"
fi

if [[ "$_temp" ]]; then
    version=$("$_temp" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo version "$version"
    
    if [[ "$version" > "1.8" ]] && [[ "$version" < "1.9" ]]; then
         echo Your Version of ? is more than ? but less than ?
         echo No need to Upgrade... Skipping Installation Step
         echo ? has already been installed.
         echo Complete.
	 
    elif [[ "$version" > "1.9" ]]; then        
         echo Your Version of ? is greater than ?
        
    else 
 	 echo Your Version of ? is less than ?
	 echo Upgrading to ?...

	 #With Homebrew we will install Java 8
	 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	 brew update
       # brew tap caskroom/cask
       # brew cask install caskroom/versions/java8

         echo INSTALLED.
         echo Complete.
	
    fi
fi
