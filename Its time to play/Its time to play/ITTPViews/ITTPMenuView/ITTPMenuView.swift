//
//  ITTPMenuView.swift
//  Its time to play
//
//

import SwiftUI

struct ITTPMenuView: View {
    @State private var showGame = false
    @State private var showAchievement = false
    @State private var showSettings = false
    
    
    @StateObject var achievementVM = SRAchievementsViewModel()
    @StateObject var settingsVM = SettingsViewModelSR()
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    Button {
                        showAchievement = true
                    } label: {
                        ZStack {
                            Image(.achievementsIconITTP)
                                .resizable()
                                .scaledToFit()
                                .frame(height: SRDeviceInfo.shared.deviceType == .pad ? 140:72)
                            
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        showSettings = true
                    } label: {
                        Image(.settingsIconITTP)
                            .resizable()
                            .scaledToFit()
                            .frame(height: SRDeviceInfo.shared.deviceType == .pad ? 140:72)
                    }
                }
                
                Spacer()
                
                Button {
                    showGame = true
                    
                } label: {
                    
                    ZStack {
                        Image(.newGameIconITTP)
                            .resizable()
                            .scaledToFit()
                            .frame(height: SRDeviceInfo.shared.deviceType == .pad ? 210:150)
                        
                        
                        
                    }
                }
                
                
            }
            
            
        }.padding()
            .background(
                ZStack {
                    Image(.appBgITTP)
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                }
            )
            .fullScreenCover(isPresented: $showGame) {
                //            SRGameLevelsView()
            }
            .fullScreenCover(isPresented: $showAchievement) {
                ITTPAchievementsView(viewModel: achievementVM)
            }
            .fullScreenCover(isPresented: $showSettings) {
                ITTPSettingsView(settingsVM: settingsVM)
            }
        
        
        
        
    }
    
}

#Preview {
    ITTPMenuView()
}
