# DesignSystem
This project provide library with Alerts appearing, that supports UIKit and SwiftUI user interface frameworks. 

📖 Description
This library provides with 3 types of alert, which indicate success, error or notify user with some information.
All alerts supports accessability functionality.

🚀 Getting Started
In the current project, you provided with (DesignSystem.wcworkspace) that contains a package for the library and two showroom application, as example to show the result of library work with SwiftUI and UIKit integrations. Also, Provided several options, how alerts can be presented or integrated in other applications.

Step 1: Clone the Provided Repository. This repository contains package for the library and two showroom example application.

Step 2: Run and take a look on, how alerts can be integrated to the system.

🛠 Technical Abilities
Ability 1: Universal Alert Component 📌 Provide only Alert view, which can be added anywhere in the main app

For exampe:

// For cteating type of alerts should be used one of the type from provided enum 

 enum DesignSystemAlertType {
    case error(title: String)
    case success(title: String)
    case notify(title: String)
 }

SwiftUI:

// For create an Alert, you can use the initalizer that takes type and title string.
 DSAlert(
    type: .notify(title: "Notification Message"), 
    tapAction: {
       // action on close button tap
    }
 )
 
 // This call will return configured AlertView as View type, which can be used in the app

UIKit:

// For create an Alert, you can use the initalizer that takes type and title string.
 UIDSAlert(type: .notify(title: "Notification Message")) {
       // action on close button tap
 }.view
 
  // This call will return configured AlertView as UIView type, which can be used in the app

Ability 2: Over Content Screen with Alert 📌 Provide Screen with appearing Alert with animation, in top of it.

SwiftUI:

// For create Over Content Screen with Alert, for SwiftUI you can use the initalizer that takes a title string.
 DesignSystemAlert().swiftUIAlert(withType: .notify(title: "Notification Message")) {
        // action on close button tap
  }
  
// This call will return configured AlertView as AnyView type, which can be used in the app

UIKit:
// For create Over Content Screen with Alert, for UIKit you can use the initalizer that takes a title string.
 DesignSystemAlert().uiKitAlert(withType: .notify(title: "Notification Message")) {
        // action on close button tap
 }
        
 // This call will return UIViewController with configured AlertView, which can be used in the app
        
🙌 Conclusion
Hope ypu will enjoy the Alert Library functionality!
