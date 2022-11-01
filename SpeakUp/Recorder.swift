//
//  Recorder.swift
//  SpeakUp
//
//  Created by Jacek Kosinski U on 31/10/2022.
//

import Foundation
import AVFoundation
import Speech




class Recorder: ObservableObject{
    
    enum RecordingState{
    case waiting,recording,transcribing,complete(Recording)
}
    @Published var recordingState = RecordingState.waiting
    private var recordingSession = AVAudioSession.sharedInstance()
    private var audioRecorder: AVAudioRecorder?
    private let temporaryURL = URL.documentsDirectory.appending(path: "recording.m4a")
    @Published var errorMessage = ""
    
    func requestRecordingPermission() {
        
    }
    
    private func requestTranscribePermission(){
        
    }
    private func startRecording() {
        
    }
    
    func stopRecording(){
        
    }
    
    private func transcribe() {
        
    }
}
