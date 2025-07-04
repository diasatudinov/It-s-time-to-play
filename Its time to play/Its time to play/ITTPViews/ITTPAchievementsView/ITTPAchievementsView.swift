//
//  ITTPAchievementsView.swift
//  Its time to play
//
//

import SwiftUI

struct ITTPAchievementsView: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var viewModel: ITTPAchievementsViewModel
    var body: some View {
        ZStack {
            
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
                    
                    Text("Achievments")
                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 50:36))
                        .foregroundStyle(.white)
                }.padding([.top, .horizontal])
                ScrollView {
                    VStack {
                        ForEach(viewModel.achievements, id: \.self) { achieve in
                            achievementItem(item: achieve)
                                .foregroundStyle(.black)
                        }
                    }
                }
               
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
    
    @ViewBuilder func achievementItem(item: ITTPAchievement) -> some View {
        ZStack(alignment: .leading) {
            Image(.achievementsBgITTP)
                .resizable()
                .scaledToFit()
            HStack(spacing: 12) {
                Image(item.isAchieved ? item.image:"\(item.image)Off")
                    .resizable()
                    .scaledToFit()
                    .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 200:100)
                
                VStack(alignment: .leading) {
                    Text("\(item.name)")
                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 50:32))
                    Text("\(item.subtitle)")
                        .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 30:20))
                }
            
            }.padding(.horizontal, 24)
            
        }
        .frame(width: ITTPDeviceInfo.shared.deviceType == .pad ? 700:370,height: ITTPDeviceInfo.shared.deviceType == .pad ? 280:140)
            .onTapGesture {
                viewModel.achieveToggle(item)
            }
    }
    
}


#Preview {
    ITTPAchievementsView(viewModel: ITTPAchievementsViewModel())
}
