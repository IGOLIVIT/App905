//
//  ContentView.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Projects

    @AppStorage("status") var status: Bool = true
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {
                        
                        ProjectsView()
                            .tag(Tab.Projects)
                        
                        WorkshopView()
                            .tag(Tab.Workshop)
                        
                        IdeasView()
                            .tag(Tab.Ideas)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
