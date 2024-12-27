## 1.0.8
* Android, iOS: Fixed potential crash when app switched between networks and updates registration 
* Generate random port number on plugin level when adding new account

## 1.0.7
* Android: Added ability to handle AirPlaneMode ON/OFF; Fixes related to handle networks switching; 
* iOS: Fixes related to handle networks switching and restore registration when app becomes active; 

## 1.0.6
* iOS: Fixed crash when app restored from background

## 1.0.5
* iOS: Added ability to re-create transports when app become active after long time in background
* Fixed wrong argument of method 'updateAccount' in 'platform_interface'

## 1.0.4
* Added CallKit support to iOS (library automatically manages it)
* Fixed logs flooding with UDP transport error

## 1.0.3
* Updated iOS lib (added MinimumOSVersion in plist)

## 1.0.2
* Fixed handling case when app adds duplicate subscription.
* Now library raises error 'ESubscrAlreadyExist' and also returns existing subscrId

## 1.0.1
* Fixed podspec file for ios/macos
* Added documentation comments
* Added new ini property 'brandName'
* Enabled ability to make attended transfer when call on hold

## 1.0.0
* Initial release. 
* Includes SiprixSDK in binary form for 5 platforms and ready to use models for easy UI development.
