//
//  Recording.swift
//  SpeakUp
//
//  Created by Paul Hudson on 25/09/2022.
//

import Foundation

struct Recording: Identifiable, Codable {
    let id: UUID
    var date: Date
    var filename: String
    var transcription: String

    static let example = Recording(id: UUID(), date: .now, filename: "example.m4a", transcription: "Example transcription here.")
}
