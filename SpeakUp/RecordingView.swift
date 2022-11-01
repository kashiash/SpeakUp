//
//  RecordingView.swift
//  SpeakUp
//
//  Created by Jacek Kosinski U on 31/10/2022.
//

import SwiftUI

struct RecordingView: View {
    let recording: Recording
    var body: some View {
        NavigationLink{
            Text(recording.transcription)
            
        } label: {
            VStack(alignment: .leading) {
                Text(recording.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.headline)
                Text(recording.transcription)
                    .lineLimit(2)
            }
        }
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView(recording: .example)
    }
}
