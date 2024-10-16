//
//  R3.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Capture ideas to implement them")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Next")
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
    R3()
}
