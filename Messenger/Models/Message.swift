//
//  Message.swift
//  Messenger
//
//  Created by Ian McLean on 4/13/24.
//

import Foundation

enum MessageType: String {
    case sent
    case received
}


struct Message {
    let text: String
    let type: MessageType
    let created: String // Date
}
