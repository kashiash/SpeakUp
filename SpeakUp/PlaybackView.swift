//
//  PlaybackView.swift
//  SpeakUp
//
//  Created by Jacek Kosinski U on 01/11/2022.
//

import AVFoundation
import SwiftUI

struct PlaybackView: View {
    @State private var player: AVAudioPlayer?
    let recording: Recording

    var body: some View {
        ScrollView {
            Text(recording.transcription)
                .padding()
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: play) {
                Label("Play Recording", systemImage: "play")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
        }
        .navigationTitle(recording.date.formatted(date: .abbreviated, time: .shortened))
        .navigationBarTitleDisplayMode(.inline)
    }

    func play() {
        do {
            let url = URL.documentsDirectory.appending(path: recording.filename)
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct PlaybackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PlaybackView(recording: .example)
        }
    }
}