//
//  SimpleChatApp.swift
//  SimpleChat
//
//  Created by LEARN Academy on 7/16/23.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		FirebaseApp.configure()
		return true
	}
}

@main
struct YourApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	
	
	var body: some Scene {
		WindowGroup {
			NavigationView {
				ContentView()
			}
		}
	}
}
