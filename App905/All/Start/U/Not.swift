//
//  Not.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Best practices for progress in any direction")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 220, height: 50)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                })
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Close")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 220, height: 50)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    Not()
}
