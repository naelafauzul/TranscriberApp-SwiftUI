//
//  Voice.swift
//  TranscribeApp
//
//  Created by Naela Fauzul Muna on 06/03/24.
//

import Foundation

enum VoiceChatState {
    case idle
    case recordingSpeech
    case processingSpeech
    case error(Error)
}
