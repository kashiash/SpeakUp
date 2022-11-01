

import SwiftUI

struct NewRecordingView: View {

    @StateObject private var recorder = Recorder()
    @EnvironmentObject var dataController: DataController
    @Environment(\.dismiss) var dismiss
    
    
    @State private var selectedLanguage: [SupportedLanguage]

    
    

    
    var body: some View {
      
        VStack {
            switch recorder.recordingState {
            case .waiting:
                VStack{
                    Picker("Please choose a language", selection: $selectedLanguage) {
                        ForEach(recorder.supportedLanguage(), id: \.self) {
                            Text($0.name ?? "nope")
                        }
                    }
                    Text("You selected: \(selectedLanguage.description )")
                    
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


