//
//  NewRecordingView.swift
//  SpeakUp
//
//  Created by Jacek Kosinski U on 01/11/2022.
//

import SwiftUI

struct NewRecordingView: View {
    @StateObject private var recorder = Recorder()
    @EnvironmentObject var dataController : DataController
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            switch recorder.recordingState {
            case .waiting:
                Button(action: recorder.requestRecordingPermission) {
                    Label("Start Recording", systemImage:
                    "record.circle")
                    .font(.title)
                }
            case .recording :
                Button(role: .destructive, action: recorder.stopRecording) {
                    Label("Stop Recording", systemImage: "stop.circle")
                }
            case .transcribing:
                VStack{
                    Text("Transcribing...")
                    ProgressView()
                }
            case .complete(let recording):
                VStack{
                    ScrollView{
                        Text(recording.transcription)
                            .padding()
                    }
                }
            }
            Text(recorder.errorMessage)
        }
    }
}

struct NewRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecordingView().environmentObject(DataController())
    }
}
