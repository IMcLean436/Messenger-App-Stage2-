//
//  ChatView.swift
//  Messenger
//
//  Created by Ian McLean on 4/13/24.
//

import SwiftUI

struct CustomField: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
    }
}

struct ChatView: View {
    @State var message: String = ""
    let otherUsername: String
    
    init(otherUsername: String) {
        self.otherUsername = otherUsername
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ChatRow(text: "Hello Whirled", type: .sent)
                    .padding(3)
                ChatRow(text: "Hello Whirled", type: .received)
                    .padding(3)
            }
            //Field, Send Button
            HStack {
                TextField("Message..", text: $message)
                    .modifier(CustomField())
                
                SendButton(text: $message)
             
                
            }
            .padding()
        }
        .navigationTitle(otherUsername)
    }
}

#Preview {
    ChatView(otherUsername: "Samantha")
}
