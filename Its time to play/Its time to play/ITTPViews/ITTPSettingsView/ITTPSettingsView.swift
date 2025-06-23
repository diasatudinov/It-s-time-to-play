//
//  ITTPSettingsView.swift
//  Its time to play
//
//

import SwiftUI

struct ITTPSettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var settingsVM: SettingsViewModelSR
    var body: some View {
        ZStack {
            
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
                  
                    Text("Settings")
                        .font(.custom(Fonts.regular.rawValue, size: SRDeviceInfo.shared.deviceType == .pad ? 70:36))
                        .foregroundStyle(.white)
                }.padding([.horizontal, .top])
                
                VStack(alignment: .center) {
                    
                    ZStack {
                        Image(.soundsBgITTP)
                            .resizable()
                            .scaledToFit()
                            
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    settingsVM.soundEnabled.toggle()
                                }
                            } label: {
                                
                                Image(settingsVM.soundEnabled ? .onITTP:.offITTP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: SRDeviceInfo.shared.deviceType == .pad ? 80:44)
                            }
                        }.padding(.horizontal, SRDeviceInfo.shared.deviceType == .pad ? 60:32)
                    }.frame(width: SRDeviceInfo.shared.deviceType == .pad ? 700:370,height: SRDeviceInfo.shared.deviceType == .pad ? 150:79)
                    
                    ZStack {
                        Image(.musicBgITTP)
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    settingsVM.musicEnabled.toggle()
                                }
                            } label: {
                                
                                Image(settingsVM.musicEnabled ? .onITTP:.offITTP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: SRDeviceInfo.shared.deviceType == .pad ? 80:44)
                            }
                        }.padding(.horizontal, SRDeviceInfo.shared.deviceType == .pad ? 60:32)
                    }.frame(width: SRDeviceInfo.shared.deviceType == .pad ? 700:370,height: SRDeviceInfo.shared.deviceType == .pad ? 150:79)
                    
                    ZStack {
                        Image(.vibroBgITTP)
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    settingsVM.vibraEnabled.toggle()
                                }
                            } label: {
                                
                                Image(settingsVM.vibraEnabled ? .onITTP:.offITTP)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: SRDeviceInfo.shared.deviceType == .pad ? 80:44)
                            }
                        }.padding(.horizontal, SRDeviceInfo.shared.deviceType == .pad ? 60:32)
                    }.frame(width: SRDeviceInfo.shared.deviceType == .pad ? 700:370,height: SRDeviceInfo.shared.deviceType == .pad ? 150:79)
                }
                
                Spacer()
            }
        }.background(
            ZStack {
                Image(.appBgITTP)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
        )
    }
}

#Preview {
    ITTPSettingsView(settingsVM: SettingsViewModelSR())
}
