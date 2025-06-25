//
//  ITTPMarkerView.swift
//  Its time to play
//
//

import SwiftUI

struct ITTPMarkerView: View {
    var text: String
    var isOpen: Bool
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Image(isOpen ? .markerTopITTP : .markerTopOffITTP)
                    .resizable()
                    .scaledToFit()
                    .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 90:65)
                
                Text(text)
                    .font(.custom(Fonts.regular.rawValue, size: ITTPDeviceInfo.shared.deviceType == .pad ? 40:30))
                    .foregroundStyle(.white)
            }
            Image(isOpen ? .markerBottomITTP: .markerBottomOffITTP)
                .resizable()
                .scaledToFit()
                .frame(height: ITTPDeviceInfo.shared.deviceType == .pad ? 120:71)
        }
    }
}

#Preview {
    ITTPMarkerView(text: "Sacred Mountain", isOpen: false)
}
