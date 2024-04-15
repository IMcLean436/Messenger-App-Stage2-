//
//  SignInView.swift
//  Messenger
//
//  Created by Ian McLean on 4/13/24.
//

import SwiftUI

struct SignInView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        NavigationView {
            VStack {
                // HEADING
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 155, height: 155)
                Text("Messenger")
                    .bold()
                    .font(.system(size: 34))
                
                // TEXT FIELDS
                VStack {
                    TextField("Username", text: $username)
                        .modifier(CustomField())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .modifier(CustomField())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    Button(action: {
                        self.signIn()
                    }, label: {
                        Text("Sign In")
                            .foregroundStyle(Color.white)
                            .frame(width: 220, height: 50)
                            .background(Color.blue)
                            .cornerRadius(16)
                    })
                }
                .padding()
                
                Spacer()
                
                //SIGN UP
                HStack {
                    Text("New to Messenger?")
                    NavigationLink("Create Account", destination: SignUpView())
                }
            }
        }
    }
    
    func signIn() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
        model.signIn(username: username, password: password)
    }
}

#Preview {
    SignInView()
}
