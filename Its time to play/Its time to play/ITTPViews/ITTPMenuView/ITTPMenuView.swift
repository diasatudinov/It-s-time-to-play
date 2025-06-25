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
    
    
    @StateObject var achievementVM = ITTPAchievementsViewModel()
    @StateObject var settingsVM = ITTPSettingsViewModel()
    @StateObject var gameVM = ITTPNewGameViewModel()
    
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
                                .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 140:72)
                            
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        showSettings = true
                    } label: {
                        Image(.settingsIconITTP)
                            .resizable()
                            .scaledToFit()
                            .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 140:72)
                    }
                }
                
                Spacer()
                
                VStack(spacing: 0) {
                    if gameVM.isNewGameStarted {
                        
                        Button {
                            showGame = true
                        } label: {
                            ZStack {
                                Image(.btnBgITTP)
                                    .resizable()
                                    .scaledToFit()
                                
                                VStack {
                                    Text("Continue")
                                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 50:36))
                                        .foregroundStyle(.white)
                                    
                                    Text(gameVM.isAct1 ? "Act I":"Act II")
                                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 50:36))
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        
                        Button {
                            showGame = true
                            DispatchQueue.main.async {
                                newGameStart()
                            }
                        } label: {
                            ZStack {
                                Image(.newGameIconOffITTP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 210:150)
                                
                            }
                        }
                        
                    } else {
                        Button {
                            showGame = true
                            
                        } label: {
                            
                            ZStack {
                                Image(.newGameIconITTP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 210:150)
                                
                                
                                
                            }
                        }
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
                ITTPNewGameView(viewModel: gameVM)
            }
            .fullScreenCover(isPresented: $showAchievement) {
                ITTPAchievementsView(viewModel: achievementVM)
            }
            .fullScreenCover(isPresented: $showSettings) {
                ITTPSettingsView(settingsVM: settingsVM)
            }
        
        
        
        
    }
    
    private func newGameStart() {
        gameVM.levels = [
            ITTPLevel(
                name: "Field",
                longName: "Hunting Field",
                act: .act1,
                itemName: "FieldItem",
                bgName: "FieldBg",
                isActive: true,
                isPassed: false
            ),
            ITTPLevel(
                name: "River",
                longName: "Great River",
                act: .act1,
                itemName: "RiverItem",
                bgName: "RiverBg",
                isActive: false,
                isPassed: false
            ),
            ITTPLevel(
                name: "Mountain",
                longName: "Sacred Mountain",
                act: .act1,
                itemName: "MountainItem",
                bgName: "MountainBg",
                isActive: false,
                isPassed: false
            ),
            ITTPLevel(
                name: "Camp",
                longName: "Camp Center",
                act: .act1,
                itemName: "CampItem",
                bgName: "CampBg",
                isActive: false,
                isPassed: false
            ),
            ITTPLevel(
                name: "Fire",
                longName: "Sacred Fire",
                act: .act1,
                itemName: "FireItem",
                bgName: "FireBg",
                isActive: false, isPassed: false
            ),
            ITTPLevel(
                name: "Cave",
                longName: "Cave of Dreams",
                act: .act2,
                itemName: "CaveItem",
                bgName: "CaveBg",
                isActive: true,
                isPassed: false
            ),
            ITTPLevel(
                name: "Forest",
                longName: "Forest of Shadows",
                act: .act2,
                itemName: "ForestItem",
                bgName: "ForestBg",
                isActive: false,
                isPassed: false
            ),
            ITTPLevel(
                name: "Hill",
                longName: "Windy Hills",
                act: .act2,
                itemName: "HillItem",
                bgName: "HillBg",
                isActive: false,
                isPassed: false
            ),
            ITTPLevel(
                name: "Lake",
                longName: "Lake of Reflections",
                act: .act2,
                itemName: "LakeItem",
                bgName: "LakeBg",
                isActive: false,
                isPassed: false
            ),
            ITTPLevel(
                name: "Temple",
                longName: "Temple of Ancestors",
                act: .act2,
                itemName: "TempleItem",
                bgName: "TempleBg",
                isActive: false, isPassed: false
            ),
            
            
        ]
        
        gameVM.isNewGameStarted = false
        gameVM.isAct2Finished = false
        gameVM.isAct1Finished = false
        gameVM.isAct1 = true
    }
    
}

#Preview {
    ITTPMenuView()
}
