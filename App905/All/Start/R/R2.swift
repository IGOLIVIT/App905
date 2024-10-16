//
//  R2.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Save your created projects in one place")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R3()
                        .navigationBarBackButtonHidden()
                    
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
    R2()
}
