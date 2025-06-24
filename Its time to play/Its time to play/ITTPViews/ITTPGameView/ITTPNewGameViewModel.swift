//
//  ITTPNewGameViewModel.swift
//  Its time to play
//
//

import SwiftUI

enum Act: Codable {
    case act1
    case act2
}

class ITTPNewGameViewModel: ObservableObject {
    
    @Published var levels: [ITTPLevel] = [
        ITTPLevel(name: "Field", longName: "Hunting Field", act: .act1, itemName: "FieldItem", bgName: "FieldBg", isPassed: false),
        ITTPLevel(name: "River", longName: "Great River", act: .act1, itemName: "RiverItem", bgName: "RiverBg", isPassed: false),
        ITTPLevel(name: "Mountain", longName: "Sacred Mountain", act: .act1, itemName: "MountainItem", bgName: "MountainBg", isPassed: false),
        ITTPLevel(name: "Camp", longName: "Camp Center", act: .act1, itemName: "CampItem", bgName: "CampBg", isPassed: false),
        ITTPLevel(name: "Fire", longName: "Sacred Fire", act: .act1, itemName: "FireItem", bgName: "FireBg", isPassed: false),
        
        
        
    ] {
        didSet {
            saveAchievementsItem()
        }
    }
    
    @AppStorage("newGame") var isNewGameStarted = false
    @AppStorage("isAct1") var isAct1 = true
    
    init() {
        loadAchievementsItem()
        
    }
    
    private let userDefaultsAchievementsKey = "levelsKeyITTP"
    
    func saveAchievementsItem() {
        if let encodedData = try? JSONEncoder().encode(levels) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsAchievementsKey)
        }
        
    }
    
    func loadAchievementsItem() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsAchievementsKey),
           let loadedItem = try? JSONDecoder().decode([ITTPLevel].self, from: savedData) {
            levels = loadedItem
        } else {
            print("No saved data found")
        }
    }
}

struct ITTPLevel: Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var longName: String
    var act: Act
    var itemName: String
    var bgName: String
    var isPassed: Bool
}
