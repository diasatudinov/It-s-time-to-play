//
//  SRAchievementsViewModel.swift
//  Its time to play
//
//


import SwiftUI

class SRAchievementsViewModel: ObservableObject {
    
    @Published var achievements: [SRAchievement] = [
        SRAchievement(image: "achi1ITTP", name: "Awakening", subtitle: "Start Act I", isAchieved: false),
        SRAchievement(image: "achi2ITTP", name: "Hunter", subtitle: "Finish Act I", isAchieved: false),
        SRAchievement(image: "achi3ITTP", name: "Seeker", subtitle: "Start Act II", isAchieved: false),
        SRAchievement(image: "achi4ITTP", name: "Ascended", subtitle: "Finish Act II", isAchieved: false),

    ] {
        didSet {
            saveAchievementsItem()
        }
    }
    
    init() {
        loadAchievementsItem()
        
    }
    
    private let userDefaultsAchievementsKey = "achievementsKeyITTP"
    
    func achieveToggle(_ achive: SRAchievement) {
        guard let index = achievements.firstIndex(where: { $0.id == achive.id })
        else {
            return
        }
        achievements[index].isAchieved.toggle()
        
    }
    
    
    func saveAchievementsItem() {
        if let encodedData = try? JSONEncoder().encode(achievements) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsAchievementsKey)
        }
        
    }
    
    func loadAchievementsItem() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsAchievementsKey),
           let loadedItem = try? JSONDecoder().decode([SRAchievement].self, from: savedData) {
            achievements = loadedItem
        } else {
            print("No saved data found")
        }
    }
}

struct SRAchievement: Codable, Hashable, Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var subtitle: String
    var isAchieved: Bool
}
