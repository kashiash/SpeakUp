//
//  DataController.swift
//  SpeakUp
//
//  Created by Jacek Kosinski U on 31/10/2022.
//

import Foundation

class DataController : ObservableObject {
    @Published private var recordings: [Recording]
    @Published var filter = ""
    
    var filteredRecordings: [Recording]{
        if filter.isEmpty {
            return recordings
        } else {
            return recordings.filter { $0.transcription.localizedCaseInsensitiveContains(filter) }
        }
    }
    
    let saveURL = URL.documentsDirectory.appending(path: "recordings.json")
    
    init(){
        if let data = try? Data(contentsOf: saveURL){
            recordings = (try? JSONDecoder().decode([Recording].self, from: data)) ?? []
        } else {
            recordings = []
        }
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(recordings){
            try? data.write(to: saveURL,options: [.atomic,.completeFileProtection])
        }
    }
    
    func add(recording: Recording){
        recordings.insert(recording, at:0)
        save()
    }
    func delete(indexSet: IndexSet){
        for index in indexSet{
            let url = URL.documentsDirectory.appending(path: recordings[index].filename)
            try? FileManager.default.removeItem(at: url)
        }
        recordings.remove(atOffsets: indexSet)
        save()
    }
}
