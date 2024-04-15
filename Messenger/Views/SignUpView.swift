//
//  SignUpView.swift
//  Messenger
//
//  Created by Ian McLean on 4/13/24.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        
        VStack {
            // HEADING
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 155, height: 155)
            Text("Create Account")
                .bold()
                .font(.system(size: 34))
            
            // TEXT FIELDS
            VStack {
                TextField("Email Address", text: $email)
                    .modifier(CustomField())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                TextField("Username", text: $username)
                    .modifier(CustomField())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                    .modifier(CustomField())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                
                Button(action: {
                    self.signUp()
                }, label: {
                    Text("Sign Up")
                        .foregroundStyle(Color.white)
                        .frame(width: 220, height: 50)
                        .background(Color.green)
                        .cornerRadius(16)
                })
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle("Create Account", displayMode: . inline)
    }

        
        func signUp() {
            guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
                  !email.trimmingCharacters(in: .whitespaces).isEmpty,
                  !password.trimmingCharacters(in: .whitespaces).isEmpty,
                  password.count >= 6 else {
                return
            }
            
            model.signUp(email: email, username: username, password: password)
        }
    }


#Preview {
    SignUpView()
}
