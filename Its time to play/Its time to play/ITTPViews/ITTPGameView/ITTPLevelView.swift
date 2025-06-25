//
//  ITTPLevelView.swift
//  Its time to play
//
//

import SwiftUI

struct ITTPLevelView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var viewModel: ITTPNewGameViewModel
    var level: ITTPLevel
    @State var showOnboard = true
    @State private var showItem = false
    @State private var scale: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            
            ScrollView(.horizontal) {
                ZStack {
                    Image(level.bgName)
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFit()
                    
                    HStack {
                        Spacer()
                        Image("\(viewModel.levelPass(currentLevel: level))")
                            .resizable()
                            .scaledToFit()
                            .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 200:120)
                            .opacity(0.3)
                            .offset(x: viewModel.levelItemPosition(currentLevel: level).x, y: viewModel.levelItemPosition(currentLevel: level).y)
                            .onTapGesture {
                                itemFound()
                            }
                        Spacer()
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
                    
                    
                    Text("\(level.longName)")
                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 50:36))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.trailing)
                    
                    
                    
                    
                }.padding([.horizontal, .top])
                
                Spacer()
                if showOnboard {
                    HStack {
                        ZStack(alignment: .bottomLeading) {
                            Image(.onboardingLevelBgITTP)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading) {
                                
                                Text(viewModel.currentLevelPassInfo(currentLevel: level) ? viewModel.levelFinishText(currentLevel: level): viewModel.levelOnbording(currentLevel: level))
                                    .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 35:20))
                                    .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 175:100)
                                    .padding()
                                
                                Button {
                                    if viewModel.currentLevelPassInfo(currentLevel: level) {
                                        presentationMode.wrappedValue.dismiss()
                                        
                                    } else {
                                        showOnboard = false
                                    }
                                   
                                } label: {
                                    Image(.startBtnITTP)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 100:48)
                                        .padding(.bottom, 20)
                                        .padding(.leading, 15)
                                }
                            }
                        }.frame(width: ITTPDeviceInfo.shared.deviceType == .pad ? 500:300, height: ITTPDeviceInfo.shared.deviceType == .pad ? 350:200)
                    }
                }
                
            }
            
            if showItem {
                VStack {
                    ZStack {
                        
                        Image(.lightsBgITTP)
                            .resizable()
                            .scaledToFit()
                        
                        Image("\(viewModel.levelPass(currentLevel: level))")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: ITTPDeviceInfo.shared.deviceType == .pad ? 500:320, height: ITTPDeviceInfo.shared.deviceType == .pad ? 500:320)
                            .scaleEffect(scale)
                            .animation(.easeOut(duration: 0.3), value: scale)
                        
                    }
                   
                }
            }
            
        }
    }
    
    private func itemFound() {
        withAnimation(.easeOut(duration: 0.3)) {
            showItem = true
            scale = 0.5
        }
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            scale = 1.2
        }
        
        viewModel.levelItem(currentLevel: level)
        viewModel.openNextLocation(currentLocation: level)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showItem = false
            showOnboard = true
        }
    }
}

#Preview {
    ITTPLevelView(viewModel: ITTPNewGameViewModel(), level: ITTPLevel(
        name: "Field",
        longName: "Hunting Field",
        act: .act1,
        itemName: "FieldItem",
        bgName: "FieldBg",
        isActive: true,
        isPassed: false
    )
    )
}
