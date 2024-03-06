//
//  MeetingData.swift
//  TranscribeApp
//
//  Created by Naela Fauzul Muna on 05/03/24.
//

import Foundation


// Definisi model data
struct MeetingSummary {
    var title: String
    var description: String
    var date: String
}

// Data contoh untuk digunakan dalam list
let meetingData: [MeetingSummary] = [
    MeetingSummary(title: "Holiday Meeting", description: "Di suatu hari yang cerah saya ingin pergi ke pantai namun saya tidak membawa baju renang sehingga saya tidak bisa berenang kemudian saya membeli baju renang di sebuah toko baju.", date: "Mon, 12 Mar 2024"),
    MeetingSummary(title: "Annual Meeting", description: "Pembahasan mengenai rencana tahunan dan evaluasi kinerja.", date: "Fri, 15 Apr 2024"),
    MeetingSummary(title: "Budget Review", description: "Analisis dan evaluasi penggunaan anggaran semester pertama.", date: "Wed, 20 May 2024")
]

