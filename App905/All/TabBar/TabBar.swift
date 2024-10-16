//
//  TabBar.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.black.opacity(0.7))
                            .frame(width: 15, height: 15)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.black.opacity(0.7))
                            .font(.system(size: 13, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 36)
        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim2")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Projects = "Projects"
    
    case Workshop = "Workshop"
    
    case Ideas = "Ideas"
    
    case Settings = "Settings"
            
}
