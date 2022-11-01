//
//  ContentView.swift
//  SpeakUp
//
//  Created by Jacek Kosinski U on 31/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataController = DataController()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(dataController.filteredRecordings,
                    content: RecordingView.init)
                        .onDelete(perform: dataController.delete)
                }
            .searchable(text: $dataController.filter)
            .navigationTitle("Speak Up!")
            .toolbar{
                Button{
                    print("Make new recording")
                } label: {
                    Label("New Recording",systemImage: "plus")
                }
            }
            .environmentObject(dataController)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
