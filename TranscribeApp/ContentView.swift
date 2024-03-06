//
//  ContentView.swift
//  TranscribeApp
//
//  Created by Naela Fauzul Muna on 05/03/24.
//

import SwiftUI


enum TabbedItems: Int, CaseIterable {
    case record = 0
    case summary
    
    
    var title: String {
        switch self {
        case .record:
            return "Record"
        case .summary:
            return "Summary"
            
        }
    }
    
    var iconName: String{
        switch self {
        case .record:
            return "waveform.circle"
        case .summary:
            return "square.and.pencil.circle"
        }
    }
    
    var icon: String{
        switch self {
        case .record:
            return "waveform.circle.fill"
        case .summary:
            return "square.and.pencil.circle.fill"
        }
    }
}


struct ContentView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                RecordScreen()
                    .tag(0)
                
                SummaryListView()
                    .tag(1)
                
            }
            
            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(systemImage: item.iconName, imageSystem: item.icon, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 70)
            .background(.black.opacity(0.1))
            .cornerRadius(35)
            .padding(.horizontal, 70)
        }
    }
}

extension ContentView{
    func CustomTabItem(systemImage: String, imageSystem: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(systemName: isActive ? imageSystem : systemImage)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .white : .gray)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .white : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 80, height: 60)
        .background(isActive ? .black : .clear)
        .cornerRadius(30)
    }
}

#Preview {
    ContentView()
}
