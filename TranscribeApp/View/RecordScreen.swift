//
//  RecordScreen.swift
//  TranscribeApp
//
//  Created by Naela Fauzul Muna on 05/03/24.
//

import SwiftUI

struct RecordScreen: View {
    @State private var apiKey = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "mic.circle")
                    .font(.system(size: 128))
                    .foregroundStyle(.oceanBlue)
                Spacer()
                
                HStack {
                    Text("Open AI API Key:")
                        .font(.headline)
                    Text("(Get API Key here)")
                        .font(.headline)
                        .foregroundStyle(.blue)
                    Spacer()
                }
                
                HStack {
                    TextField("Enter your API Key", text: $apiKey)
                        .padding(7)
                        .background(.ultraThinMaterial)
                        .cornerRadius(8)
                    
                    Button("Save") { print("pressed") }
                        .buttonStyle(.borderedProminent)
                        
                }
                .padding(.bottom, 60)
            }
            .padding(.horizontal, 16)
            .navigationTitle("Record your meeting")
        }
        
    }
}

#Preview {
    RecordScreen()
}
