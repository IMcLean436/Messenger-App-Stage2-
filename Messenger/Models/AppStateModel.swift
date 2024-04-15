//
//  AppStateModel.swift
//  Messenger
//
//  Created by Ian McLean on 4/13/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class AppStateModel: ObservableObject {
    @AppStorage("currentUsername") var currentUsername: String = ""
    @AppStorage("currentEmail") var currentEmail: String = ""
    
    @Published var showingSignIn: Bool = true
    @Published var conversations: [String] = []
    @Published var messages: [Message] = []
    
    let database = Firestore.firestore()
    let auth = Auth.auth()
    
    var otherUsername = ""
    
    init() {
        self.showingSignIn = Auth.auth().currentUser == nil
    }
}

// SEARCH

extension AppStateModel {
    func searchUsera(queryText: String, completion: @escaping ([String]) -> Void) {
        
    }
}

// CONVERSATIONS

extension AppStateModel {
    func getConversations() {
        // Listen for conversations
    }
}

// GET CHAT / SEND MESSAGES

extension AppStateModel {
    func  observeChat() {
        
    }
    
    func sendMessage(text: String) {
        
    }
    
    func createConversationIfNeeded() {
        
    }
}

// SIGN IN & SIGN UP

extension AppStateModel {
    func signIn(username: String, password: String) {
        // Get Email from DB
        database.collection("users").document(username).getDocument {  [weak self] snapshot, error in
            guard let email = snapshot?.data()?["email"] as? String, error == nil else {
                return
            }
            
            // TRY TO SIGN IN
            self?.auth.signIn(withEmail: email, password: password, completion: { result, error in
                guard error == nil, result != nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.currentEmail = email
                    self?.currentUsername = username
                    self?.showingSignIn = false
                }
            })
        }
        
    }
    
    func signUp(email: String, username: String, password: String) {
        // Create Account
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            // insert username into database
            let data = [
                "email":email,
                "username": username
            ]
            
            self?.database
                .collection("users")
                .document(username)
                .setData(data) { error in
                    guard error == nil else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self?.currentUsername = username
                        self?.currentEmail = email
                        self?.showingSignIn = false
                    }
                }
            }
        }
    
    func signOut() {
        do {
            try auth.signOut()
            self.showingSignIn = true
        }
        catch {
            print(error)
        }
    }
}
