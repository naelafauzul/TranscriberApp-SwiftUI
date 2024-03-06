//
//  RecordScreen.swift
//  TranscribeApp
//
//  Created by Naela Fauzul Muna on 05/03/24.
//

import SwiftUI
import SiriWaveView

struct RecordScreen: View {
    
    @State var vm = ViewModel()
    @State var isSymbolAnimating = false
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 16) {
                
                Spacer()
                
                SiriWaveView()
                    .power(power: vm.audioPower)
                    .opacity(vm.siriWaveFormOpacity)
                    .frame(height: 256)
                    .overlay { overlayView }
                Spacer()
                
                switch vm.state {
                case .recordingSpeech:
                    cancelRecordingButton
                    
                case .processingSpeech:
                    cancelButton
                    
                default: EmptyView()
                }

                
                if case let .error(error) = vm.state {
                    Text(error.localizedDescription)
                        .foregroundStyle(.red)
                        .font(.caption)
                        .lineLimit(2)
                }
            }
            .padding()
            
        }
        
    }
    
    @ViewBuilder
    var overlayView: some View {
        switch vm.state {
        case .idle, .error:
            startCaptureButton
        case .processingSpeech:
            Image(systemName: "waveform")
                .symbolEffect(.bounce.up.byLayer, options: .repeating, value: isSymbolAnimating)
                .foregroundStyle(.oceanBlue)
                .font(.system(size: 128))
                .onAppear { isSymbolAnimating = true }
                .onDisappear { isSymbolAnimating = false }
        default: EmptyView()
        }
    }
    
    var startCaptureButton: some View {
        Button {
            vm.startCaptureAudio()
        } label: {
            Image(systemName: "mic.circle")
                .foregroundStyle(.oceanBlue)
                .font(.system(size: 128))
        }.buttonStyle(.borderless)
    }
    
    var cancelRecordingButton: some View {
        Button(role: .destructive) {
            vm.cancelRecording()
        } label: {
            Image(systemName: "stop.circle.fill")
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 44))
        }
        .buttonStyle(.borderless)
        .padding(.bottom, 50)

    }
    
    var cancelButton: some View {
        Button(role: .destructive) {
            vm.cancelProcessingTask()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(.red)
                .font(.system(size: 44))
        }
        .buttonStyle(.borderless)
        .padding(.bottom, 50)

    }
}

#Preview("Idle") {
    ContentView()
}

#Preview("Recording Speech") {
    let vm = ViewModel()
    vm.state = .recordingSpeech
    vm.audioPower = 0.2
    return RecordScreen(vm: vm)
}

#Preview("Processing Speech") {
    let vm = ViewModel()
    vm.state = .processingSpeech
    return RecordScreen(vm: vm)
}


#Preview("Error") {
    let vm = ViewModel()
    vm.state = .error("An error has occured")
    return RecordScreen(vm: vm)
}


//                Image(systemName: "mic.circle")
//                    .font(.system(size: 128))
//                    .foregroundStyle(.oceanBlue)
//                Spacer()
//
//                HStack {
//                    Text("Open AI API Key:")
//                        .font(.headline)
//                    Text("(Get API Key here)")
//                        .font(.headline)
//                        .foregroundStyle(.blue)
//                    Spacer()
//                }
//
//                HStack {
//                    TextField("Enter your API Key", text: $apiKey)
//                        .padding(7)
//                        .background(.ultraThinMaterial)
//                        .cornerRadius(8)
//
//                    Button("Save") { print("pressed") }
//                        .buttonStyle(.borderedProminent)
//
//                }
//                .padding(.bottom, 60)
