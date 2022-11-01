//
//  Recordin.swift
//  SpeakUp
//
//  Created by Jacek Kosinski U on 31/10/2022.
//

import Foundation

struct Recording: Identifiable, Codable {
    let id: UUID
    var date: Date
    var filename: String
    var transcription: String

    static let example = Recording(id: UUID(), date: .now, filename: "example.m4a", transcription: "Example transcription here.")
}
