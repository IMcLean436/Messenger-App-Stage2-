//
//  MessengerApp.swift
//  Messenger
//
//  Created by Ian McLean on 4/13/24.
//

import SwiftUI
import Firebase
@main
struct MessengerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate
    
    
    var body: some Scene {
        WindowGroup {
            ConversationListView()
                .environmentObject(AppStateModel())
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       
        FirebaseApp.configure()
        
        return true
    }
}
