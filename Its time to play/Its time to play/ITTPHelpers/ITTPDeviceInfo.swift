//
//  ITTPDeviceInfo.swift
//  Its time to play
//
//


import UIKit

class ITTPDeviceInfo {
    static let shared = ITTPDeviceInfo()
    
    var deviceType: UIUserInterfaceIdiom
    
    private init() {
        self.deviceType = UIDevice.current.userInterfaceIdiom
    }
}
