//
//  ITTPSplashScreen.swift
//  Its time to play
//
//

import SwiftUI

struct ITTPSplashScreen: View {
    @State private var scale: CGFloat = 1.0
    @State private var progress: CGFloat = 0.0
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            Image(.loaderBgITTP)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                
                Text("Loading (\(Int(progress))%)")
                    .font(.custom(Fonts.regular.rawValue, size: 44))
                    .foregroundStyle(.white)
                    .padding(.bottom, 32)
                
            }
            
            
        }
        .onAppear {
            startTimer()
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    ITTPSplashScreen()
}
