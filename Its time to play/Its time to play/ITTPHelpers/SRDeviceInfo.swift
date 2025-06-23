//
//  SRDeviceInfo.swift
//  Its time to play
//
//


import UIKit

class SRDeviceInfo {
    static let shared = SRDeviceInfo()
    
    var deviceType: UIUserInterfaceIdiom
    
    private init() {
        self.deviceType = UIDevice.current.userInterfaceIdiom
    }
}
