---
# FB11739659
- Issue: iOS 16.x does not correctly load App Intents extension when building with Xcode 14.1 RC2
---

When building an app with an App Intents extension with Xcode 14.1 RC 2 (21534.1), iOS 16.0 and 16.1 fail to load the intents extension. 

The same is observed when the App Intents are directly used as part for the main iOS app target.  
The debugger prints the following message: 
> Unable to fetch suggested focus intents for intent “Intent Name” 

When building the targets using Xcode 14.0.1, this works as expected and the intents target is run by the device.  

This project implements a simple `SetFocusFilterIntent` intent. 

### Steps to Reproduce

- Compile the project using Xcode 14 RC2
- Run on device running iOS 16.x 
- Open Settings.app 
- Open Focus Filters 
- Open any Focus Filter
- Tap on Add Filter to select a new focus filter
- The Intent from this app will not be visible 

### Steps to Verify 

- Compile the project using Xcode 14.0.1 
- Run on device running iOS 16.x 
- Open Settings.app 
- Open Focus Filters 
- Open any Focus Filter
- Tap on Add Filter to select a new focus filter
- The Intent from this app will be visible 
