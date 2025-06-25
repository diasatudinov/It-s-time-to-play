//
//  ITTPRoot.swift
//  Its time to play
//
//


import SwiftUI

struct ITTPRoot: View {
    
    @State private var isLoading = true
    @State var toUp: Bool = true
    @AppStorage("vers") var verse: Int = 0
    
    var body: some View {
        ZStack {
            if verse == 1 {
                ITTPWVWrap(urlString: ITTPLinks.winStarData)
            } else {
                VStack {
                    if isLoading {
                        ITTPSplashScreen()
                    } else {
                        ITTPMenuView()
                            .onAppear {
                                AppDelegate.orientationLock = .portrait
                                setOrientation(.portrait)
                            }
                            .onDisappear {
                                AppDelegate.orientationLock = .all
                            }
                            
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                updateIfNeeded()
            }
           
        }
    }
    
    func updateIfNeeded() {
        if ITTPLinks.shared.finalURL == nil {
            Task {
                if await !ITTPResolver.checking() {
                    verse = 1
                    toUp = false
                    isLoading = false
                    
                } else {
                    verse = 0
                    toUp = true
                    isLoading = false
                }
            }
        } else {
            isLoading = false
        }
        
        
    }
    
    func setOrientation(_ orientation: UIInterfaceOrientation) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let selector = NSSelectorFromString("setInterfaceOrientation:")
            if let responder = windowScene.value(forKey: "keyWindow") as? UIResponder, responder.responds(to: selector) {
                responder.perform(selector, with: orientation.rawValue)
            }
        }
    }
}

#Preview {
    ITTPRoot()
}
