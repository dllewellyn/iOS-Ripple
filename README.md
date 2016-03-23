# iOS-Ripple
A Panic button for iOS

The iOS ripple application is meant to implement as far, and as similarly as possible the Guardian Project (https://github.com/guardianproject/Ripple)

The idea is to have an application that has a 'panic button' in, this panic button then triggers every other application on the device that the button has been pressed, and they should therefore wipe any data they have. 

Due to the nature of iOS, the process will be somewhat more convulted than on Android, but follows a similar pattern to below 

* Install panic button (Panic App)
* Install application that makes use of panic button (Application A)
* Enable the panic button from within Application A
* Application A sends a 'register' message to Panic App
* Panic App stores information about Application A

![Alt text](https://github.com/dllewellyn/iOS-Ripple/blob/master/Images/RippleFlow.png)


When the user presses Panic button in the Panic App:
* The Panic App sends a 'panic' URL scheme to Application A
* Application A sends a 'complete' message back
* Panic App then loops through the remaining applications

![Alt text](https://github.com/dllewellyn/iOS-Ripple/blob/master/Images/Triggering.png)

The major component of this application ise URL Schemes, below is a pretty good guide: 

https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Inter-AppCommunication/Inter-AppCommunication.html

# Building

To build you should just be able to open in XCode, however the app relies quite a lot on Fabric.io (https://fabric.io/) so in order you run correctly, you will need to create a file called 'secrets.plist' in your main bundle, and set the following keys in it:

* consumer_key
* consumer_secret

Which you can get from setting up 'Twitter'
