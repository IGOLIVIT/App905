//
//  LoadingView.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Lav")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Text("Up Hobby")
                    .foregroundColor(.black)
                    .font(.system(size: 56, weight: .black))
                    .padding(.top, 200)
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
