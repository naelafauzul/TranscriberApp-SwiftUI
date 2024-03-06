//
//  SummaryRow.swift
//  TranscribeApp
//
//  Created by Naela Fauzul Muna on 05/03/24.
//

import SwiftUI

struct SummaryRow: View {
    var meeting: MeetingSummary
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(meeting.title)
                .font(.headline)
                .lineLimit(1)
            Text(meeting.description)
                .lineLimit(2)
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            HStack {
                Spacer()
                Text(meeting.date)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 13)
                    .background(.oceanBlue)
                    .cornerRadius(20)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.lightBlue2.opacity(0.17))
        .cornerRadius(8)
    }
}


#Preview {
    SummaryRow(meeting: MeetingSummary(title: "Education Meeting", description: "sungguh malas", date: "Mon, 12 Mar 2024"))
}
