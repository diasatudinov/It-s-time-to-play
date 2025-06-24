//
//  ITTPNewGameView.swift
//  Its time to play
//
//  Created by Dias Atudinov on 24.06.2025.
//

import SwiftUI

struct ITTPNewGameView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var viewModel: ITTPNewGameViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isNewGameStarted {
                if viewModel.isAct1 {
                    ScrollView(.horizontal) {
                        ZStack {
                            Image(.act1BgITTP)
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .scaledToFit()
                            
                            HStack {
                                ITTPMarkerView(text: viewModel.levels[3].longName, isOpen: false)
                                    .offset(x: SRDeviceInfo.shared.deviceType == .pad ? 70:40)
                                
                                ITTPMarkerView(text: viewModel.levels[4].longName, isOpen: false)
                                    .offset(x: SRDeviceInfo.shared.deviceType == .pad ? 70:40, y: SRDeviceInfo.shared.deviceType == .pad ? 160:80)
                                ITTPMarkerView(text: viewModel.levels[0].longName, isOpen: true)
                                    .offset(x: SRDeviceInfo.shared.deviceType == .pad ? 70:40, y: SRDeviceInfo.shared.deviceType == .pad ? -160:-80)
                                Spacer()
                                ITTPMarkerView(text: viewModel.levels[1].longName, isOpen: false)
                                    .offset(x: SRDeviceInfo.shared.deviceType == .pad ? 70:40, y: SRDeviceInfo.shared.deviceType == .pad ? 200:120)
                                ITTPMarkerView(text: viewModel.levels[2].longName, isOpen: false)
                                    .offset(x: SRDeviceInfo.shared.deviceType == .pad ? -70:-40, y: SRDeviceInfo.shared.deviceType == .pad ? -280:-150)
                            }
                        }
                    }
                } else {
                    
                }
            }
            
            VStack(alignment: .center, spacing: 30) {
                
                HStack(alignment: .top) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Image(.backIconITTP)
                            .resizable()
                            .scaledToFit()
                            .frame(height: SRDeviceInfo.shared.deviceType == .pad ? 140:72)
                    }
                    Spacer()
                    
                    if viewModel.isNewGameStarted {
                        if viewModel.isAct1 {
                            VStack(alignment: .trailing) {
                                Text("Lands of the \nAncestors")
                                    .font(.custom(Fonts.regular.rawValue, size: SRDeviceInfo.shared.deviceType == .pad ? 50:36))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.trailing)
                                Text("Act I")
                                    .font(.custom(Fonts.regular.rawValue, size: SRDeviceInfo.shared.deviceType == .pad ? 40:22))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.trailing)
                            }
                        } else {
                            VStack(alignment: .trailing) {
                                Text("The spiritual \npath")
                                    .font(.custom(Fonts.regular.rawValue, size: SRDeviceInfo.shared.deviceType == .pad ? 50:36))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.trailing)
                                Text("Act II")
                                    .font(.custom(Fonts.regular.rawValue, size: SRDeviceInfo.shared.deviceType == .pad ? 40:22))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                    }
                }.padding([.horizontal, .top])
                
                Spacer()
                if !viewModel.isNewGameStarted {
                    HStack {
                        ZStack(alignment: .bottomLeading) {
                            Image(.newGameTextITTP)
                                .resizable()
                                .scaledToFit()
                            
                            Button {
                                viewModel.isNewGameStarted = true
                            } label: {
                                Image(.startYourWayITTP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: SRDeviceInfo.shared.deviceType == .pad ? 100:48)
                                    .padding(.bottom, 20)
                                    .padding(.leading, 15)
                            }
                        }.frame(height: SRDeviceInfo.shared.deviceType == .pad ? 450:244)
                    }
                } else {
                    
                    if viewModel.isAct1 {
                        
                    } else {
                        
                    }
                    
                }
            }
        }.background(
            ZStack {
                if !viewModel.isNewGameStarted {
                    Image(.newGameBgITTP)
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                }
                
            }
        )
    }
}

#Preview {
    ITTPNewGameView(viewModel: ITTPNewGameViewModel())
}
