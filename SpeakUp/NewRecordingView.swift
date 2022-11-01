

import SwiftUI

struct NewRecordingView: View {

    @StateObject private var recorder = Recorder()
    @EnvironmentObject var dataController: DataController
    @Environment(\.dismiss) var dismiss
    

    
    

    
    var body: some View {
      
        VStack {
            switch recorder.recordingState {
            case .waiting:
                VStack{

                    Button(action: recorder.requestRecordingPermission) {
                        
                        
                        Label("Start Recording", systemImage: "record.circle")
                            .font(.title)
                    }
                }
            case .recording:
                Button(action: recorder.stopRecording) {
                    Label("Stop Recording", systemImage: "stop.circle")
                        .font(.title)
                }

            case .transcribing:
                VStack {
                    Text("Transcribing…")
                    ProgressView()
                }

            case .complete(let recording):
                VStack {
                    ScrollView {
                        Text(recording.transcription)
                            .padding()
                    }

                    Button("Save") {
                        dataController.add(recording: recording)
                        dismiss()
                    }
                }
            }

            Text(recorder.errorMessage)
        }
    }
}


