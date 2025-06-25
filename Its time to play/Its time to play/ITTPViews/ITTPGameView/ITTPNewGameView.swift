//
//  ITTPNewGameView.swift
//  Its time to play
//
//

import SwiftUI

struct ITTPNewGameView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var viewModel: ITTPNewGameViewModel
    @State var currentLevel: ITTPLevel = ITTPLevel(name: "", longName: "", act: .act1, itemName: "", bgName: "", isActive: false, isPassed: false)
    @State var showLevel = false
    var body: some View {
        ZStack {
            if !viewModel.isAct2Finished {
                if viewModel.isNewGameStarted {
                    if viewModel.isAct1 {
                        ScrollView(.horizontal) {
                            ZStack {
                                Image(.act1BgITTP)
                                    .resizable()
                                    .edgesIgnoringSafeArea(.all)
                                    .scaledToFit()
                                
                                HStack {
                                    ITTPMarkerView(text: viewModel.levels[3].longName, isOpen: viewModel.levels[3].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? 70:40)
                                        .onTapGesture {
                                            if viewModel.levels[3].isActive, !viewModel.levels[3].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[3]
                                                }
                                            }
                                        }
                                    
                                    ITTPMarkerView(text: viewModel.levels[4].longName, isOpen: viewModel.levels[4].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? 70:40, y: ITTPDeviceInfo.shared.deviceType == .pad ? 160:80)
                                        .onTapGesture {
                                            if viewModel.levels[4].isActive, !viewModel.levels[4].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[4]
                                                }
                                            }
                                        }
                                    
                                    ITTPMarkerView(text: viewModel.levels[0].longName, isOpen: viewModel.levels[0].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? 70:40, y: ITTPDeviceInfo.shared.deviceType == .pad ? -160:-80)
                                        .onTapGesture {
                                            if viewModel.levels[0].isActive, !viewModel.levels[0].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[0]
                                                }
                                            }
                                        }
                                    
                                    Spacer()
                                    ITTPMarkerView(text: viewModel.levels[1].longName, isOpen: viewModel.levels[1].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? 70:40, y: ITTPDeviceInfo.shared.deviceType == .pad ? 200:120)
                                        .onTapGesture {
                                            if viewModel.levels[1].isActive, !viewModel.levels[1].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[1]
                                                }
                                            }
                                        }
                                    
                                    ITTPMarkerView(text: viewModel.levels[2].longName, isOpen: viewModel.levels[2].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? -70:-40, y: ITTPDeviceInfo.shared.deviceType == .pad ? -280:-150)
                                        .onTapGesture {
                                            if viewModel.levels[2].isActive, !viewModel.levels[2].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[2]
                                                }
                                            }
                                        }
                                    
                                }
                            }
                        }
                        
                        VStack {
                            Spacer()
                            VStack(spacing: 32) {
                                if viewModel.isAct1Finished {
                                    Button {
                                        viewModel.isAct1 = false
                                    } label: {
                                        Image(.finishAct1ITTP)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 180:100)
                                    }
                                }
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(viewModel.levels.filter({ $0.act == .act1 }), id: \.self) { level in
                                            ZStack {
                                                Color.black.opacity(0.8)
                                                
                                                if level.isPassed {
                                                    Image(viewModel.levelPass(currentLevel: level))
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 150:80)
                                                }
                                                
                                            }.frame(width: ITTPDeviceInfo.shared.deviceType == .pad ? 180:100, height: ITTPDeviceInfo.shared.deviceType == .pad ? 180:100)
                                                .cornerRadius(24)
                                        }
                                    }.padding(.horizontal, 20)
                                }
                            }
                        }
                    } else {
                        ScrollView(.horizontal) {
                            ZStack {
                                Image(.act2BgITTP)
                                    .resizable()
                                    .edgesIgnoringSafeArea(.all)
                                    .scaledToFit()
                                
                                HStack {
                                    
                                    ITTPMarkerView(text: viewModel.levels[5].longName, isOpen: viewModel.levels[5].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? 70:40)
                                        .onTapGesture {
                                            if viewModel.levels[5].isActive, !viewModel.levels[5].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[5]
                                                }
                                            }
                                        }
                                    
                                    ITTPMarkerView(text: viewModel.levels[7].longName, isOpen: viewModel.levels[7].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? 70:40, y: ITTPDeviceInfo.shared.deviceType == .pad ? 160:80)
                                        .onTapGesture {
                                            if viewModel.levels[7].isActive, !viewModel.levels[7].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[7]
                                                }
                                            }
                                        }
                                    
                                    ITTPMarkerView(text: viewModel.levels[8].longName, isOpen: viewModel.levels[8].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? 70:40, y: ITTPDeviceInfo.shared.deviceType == .pad ? -160:-80)
                                        .onTapGesture {
                                            if viewModel.levels[8].isActive, !viewModel.levels[8].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[8]
                                                }
                                            }
                                        }
                                    
                                    Spacer()
                                    ITTPMarkerView(text: viewModel.levels[9].longName, isOpen: viewModel.levels[9].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? 70:40, y: ITTPDeviceInfo.shared.deviceType == .pad ? 200:120)
                                        .onTapGesture {
                                            if viewModel.levels[9].isActive, !viewModel.levels[9].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[9]
                                                }
                                            }
                                            
                                        }
                                    
                                    ITTPMarkerView(text: viewModel.levels[6].longName, isOpen: viewModel.levels[6].isActive)
                                        .offset(x: ITTPDeviceInfo.shared.deviceType == .pad ? -70:-40, y: ITTPDeviceInfo.shared.deviceType == .pad ? -280:-150)
                                        .onTapGesture {
                                            if viewModel.levels[6].isActive, !viewModel.levels[6].isPassed {
                                                showLevel = true
                                                DispatchQueue.main.async {
                                                    currentLevel = viewModel.levels[6]
                                                }
                                            }
                                        }
                                    
                                }
                            }
                        }
                        
                        VStack {
                            Spacer()
                            VStack(spacing: 32) {
                                
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(viewModel.levels.filter({ $0.act == .act2 }), id: \.self) { level in
                                            ZStack {
                                                Color.black.opacity(0.8)
                                                
                                                if level.isPassed {
                                                    Image(viewModel.levelPass(currentLevel: level))
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 150:80)
                                                }
                                                
                                            }.frame(width: ITTPDeviceInfo.shared.deviceType == .pad ? 180:100, height: ITTPDeviceInfo.shared.deviceType == .pad ? 180:100)
                                                .cornerRadius(24)
                                        }
                                    }.padding(.horizontal, 20)
                                }
                            }
                        }
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
                                .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 140:72)
                        }
                        Spacer()
                        
                        if viewModel.isNewGameStarted {
                            if viewModel.isAct1 {
                                VStack(alignment: .trailing) {
                                    Text("Lands of the \nAncestors")
                                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 50:36))
                                        .foregroundStyle(.white)
                                        .multilineTextAlignment(.trailing)
                                    Text("Act I")
                                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 40:22))
                                        .foregroundStyle(.white)
                                        .multilineTextAlignment(.trailing)
                                }
                            } else {
                                VStack(alignment: .trailing) {
                                    Text("The spiritual \npath")
                                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 50:36))
                                        .foregroundStyle(.white)
                                        .multilineTextAlignment(.trailing)
                                    Text("Act II")
                                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 40:22))
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
                                        .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 100:48)
                                        .padding(.bottom, 20)
                                        .padding(.leading, 15)
                                }
                            }.frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 450:244)
                        }
                    } else {
                        
                        if viewModel.isAct1 {
                            
                        } else {
                            
                        }
                        
                    }
                }
            } else {
                Image(.winAppBgITTP)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    
                if ITTPDeviceInfo.shared.deviceType == .pad {
                    VStack {
                        HStack(alignment: .top) {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(.backIconITTP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 140:72)
                            }
                            Spacer()
                        }
                        Spacer()
                            .frame(height: UIScreen.main.bounds.height / 2)
                        ZStack(alignment: .leading) {
                            Image(.gameEndTextITTP)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image(.backToHomeBtnITTP)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 90:48)
                                }.padding()
                            }
                            
                        }.frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 300:220)
                    }.padding()
                } else {
                    VStack {
                        HStack(alignment: .top) {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(.backIconITTP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 140:72)
                            }
                            Spacer()
                        }
                        Spacer()
                        ZStack(alignment: .leading) {
                            Image(.gameEndTextITTP)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading) {
                                Spacer()
                                
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image(.backToHomeBtnITTP)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 90:48)
                                }.padding()
                            }
                            
                        }.frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 300:220)
                    }.padding()
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
        .fullScreenCover(isPresented: $showLevel) {
            ITTPLevelView(viewModel: viewModel, level: currentLevel)
        }
    }
}

#Preview {
    ITTPNewGameView(viewModel: ITTPNewGameViewModel())
}
