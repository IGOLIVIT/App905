//
//  Reviews.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Not()
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
