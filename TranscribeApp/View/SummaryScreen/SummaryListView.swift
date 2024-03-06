//
//  SummaryListView.swift
//  TranscribeApp
//
//  Created by Naela Fauzul Muna on 05/03/24.
//

import SwiftUI

struct SummaryListView: View {
    @State private var SelectedMeeting : MeetingSummary?
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            List(meetingData, id: \.title) { item in
                SummaryRow(meeting: item)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 12, trailing: 16))
                    .onTapGesture {
                        self.SelectedMeeting = item
                        self.isPresented = true
                    }
            }
            .listStyle(.plain)
            .navigationTitle("Summary")
            
        }
        .sheet(isPresented: $isPresented) {
            // Pastikan 'selectedMeeting' tidak nil dengan Optional Chaining
            if let selectedMeeting = SelectedMeeting {
                MeetingDetail(meeting: selectedMeeting)
            }
        }
        
    }
}

#Preview {
    SummaryListView()
    
}


