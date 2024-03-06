//
//  ModalView.swift
//  TranscribeApp
//
//  Created by Naela Fauzul Muna on 05/03/24.
//

import SwiftUI

struct MeetingDetail: View {
    var meeting: MeetingSummary
    @State private var selectedSegment: Int = 0
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                
                Text(meeting.date)
                    .font(.caption)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                
                HStack {
                    Text(meeting.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        
                    Spacer()
                    
                    Image(systemName: "square.and.pencil")
                        .foregroundStyle(.blue)
                }
                .padding(.horizontal, 16)
                .padding(.top, 5)
                
                Picker("Select", selection: $selectedSegment) {
                    Text("Meeting Summary").tag(0)
                    Text("Meeting Transcribe").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                
        
                if selectedSegment == 0 {
                    Text(meeting.description)
                        .padding(.horizontal, 16)
    
                } else {
                    
                    Text("transcribe")
                        .padding(.horizontal, 16)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    MeetingDetail(meeting: meetingData[0])
}
