//
//  SettingsView.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                        Text("Settings")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))

                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim2")))
                .padding(.bottom)

                VStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(spacing: 19) {
                            
                            Image("star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                            
                            Text("Rate App")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/8c46b566-1944-4868-b191-d8d3df1a943f") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(spacing: 19) {
                            
                            Image("mail")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    })
                }
                .frame(maxHeight: .infinity)
                .padding()
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SettingsView()
}
