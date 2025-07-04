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
        ITTPLevel(
            name: "Field",
            longName: "Hunting Field",
            act: .act1,
            itemName: "FieldItem",
            bgName: "FieldBg",
            isActive: true,
            isPassed: false
        ),
        ITTPLevel(
            name: "River",
            longName: "Great River",
            act: .act1,
            itemName: "RiverItem",
            bgName: "RiverBg",
            isActive: false,
            isPassed: false
        ),
        ITTPLevel(
            name: "Mountain",
            longName: "Sacred Mountain",
            act: .act1,
            itemName: "MountainItem",
            bgName: "MountainBg",
            isActive: false,
            isPassed: false
        ),
        ITTPLevel(
            name: "Camp",
            longName: "Camp Center",
            act: .act1,
            itemName: "CampItem",
            bgName: "CampBg",
            isActive: false,
            isPassed: false
        ),
        ITTPLevel(
            name: "Fire",
            longName: "Sacred Fire",
            act: .act1,
            itemName: "FireItem",
            bgName: "FireBg",
            isActive: false, isPassed: false
        ),
        ITTPLevel(
            name: "Cave",
            longName: "Cave of Dreams",
            act: .act2,
            itemName: "CaveItem",
            bgName: "CaveBg",
            isActive: true,
            isPassed: false
        ),
        ITTPLevel(
            name: "Forest",
            longName: "Forest of Shadows",
            act: .act2,
            itemName: "ForestItem",
            bgName: "ForestBg",
            isActive: false,
            isPassed: false
        ),
        ITTPLevel(
            name: "Hill",
            longName: "Windy Hills",
            act: .act2,
            itemName: "HillItem",
            bgName: "HillBg",
            isActive: false,
            isPassed: false
        ),
        ITTPLevel(
            name: "Lake",
            longName: "Lake of Reflections",
            act: .act2,
            itemName: "LakeItem",
            bgName: "LakeBg",
            isActive: false,
            isPassed: false
        ),
        ITTPLevel(
            name: "Temple",
            longName: "Temple of Ancestors",
            act: .act2,
            itemName: "TempleItem",
            bgName: "TempleBg",
            isActive: false, isPassed: false
        ),
        
        
    ] {
        didSet {
            saveAchievementsItem()
        }
    }
    
    @AppStorage("newGame") var isNewGameStarted = false
    @AppStorage("isAct1Finished") var isAct1Finished = false
    @AppStorage("isAct2Finished") var isAct2Finished = false
    @AppStorage("isAct1") var isAct1 = true
    
    init() {
        
        loadAchievementsItem()
        
    }
    
    private let userDefaultsAchievementsKey = "levelsKeyITTPNew"
    
    func openNextLocation(currentLocation: ITTPLevel) {
        if let index = levels.firstIndex(where: { $0.name == currentLocation.name }) {
            switch levels[index].name {
            case "Field":
                levels[1].isActive = true
            case "River":
                levels[2].isActive = true
            case "Mountain":
                levels[3].isActive = true
            case "Camp":
                levels[4].isActive = true
            case "Fire":
                isAct1Finished = true
            case "Cave":
                levels[6].isActive = true
            case "Forest":
                levels[7].isActive = true
            case "Hill":
                levels[8].isActive = true
            case "Lake":
                levels[9].isActive = true
            case "Temple":
                isAct2Finished = true
            default:
                print("error")
            }
        }
    }
    
    func levelPass(currentLevel: ITTPLevel) -> String {
        if let index = levels.firstIndex(where: { $0.name == currentLevel.name }) {
            switch levels[index].name {
            case "Field":
                return "level1Item"
            case "River":
                return "level2Item"
            case "Mountain":
                return "level3Item"
            case "Camp":
                return "level4Item"
            case "Fire":
                return "level5Item"
            case "Cave":
                return levels[index].itemName
            case "Forest":
                return levels[index].itemName
            case "Hill":
                return levels[index].itemName
            case "Lake":
                return levels[index].itemName
            case "Temple":
                return levels[index].itemName
            default:
                return ""
            }
        }
        
        return ""
    }
    
    func levelOnbording(currentLevel: ITTPLevel) -> String {
        if let index = levels.firstIndex(where: { $0.name == currentLevel.name }) {
            switch levels[index].name {
            case "Field":
                return "The great hunters of the past fought here for the tribe. Their spear still holds its power."
            case "River":
                return "The waters of this river remember the steps of those who walked into the spirit world. Find the talisman that protects from their wrath."
            case "Mountain":
                return "At the mountain’s peak, spirits meet the shamans. Their stone will open the doors to another world."
            case "Camp":
                return "Here the shaman prepares the rituals. His feather is the sign of the ancestors’ wisdom."
            case "Fire":
                return "The eternal fire connects the world of the living and the spirits. Find the Ritual Mask to open the Spirit’s Path."
            case "Cave":
                return "Here dwell the lost dreams of the ancestors. The Memory Stone preserves their wisdom."
            case "Forest":
                return "The shadows of the past hide among these trees. Find the Wolf Fang — the symbol of strength."
            case "Hill":
                return "On this hill, the wind carries the voices of the spirits. The Wind Whistle will help you hear them."
            case "Lake":
                return "The waters of this lake reflect the truths of the world. Find the Dreamcatcher to hold them."
            case "Temple":
                return "Here the ancestors await you. The Great Feather will complete the trial."
            default:
                return ""
            }
        }
        
        return ""
    }
    
    func levelFinishText(currentLevel: ITTPLevel) -> String {
        if let index = levels.firstIndex(where: { $0.name == currentLevel.name }) {
            switch levels[index].name {
            case "Field":
                return "You have found the Ancestors' Spear. Its tip points the way to the Great River."
            case "River":
                return "The Water Talisman is yours. Now your path leads to the Sacred Mountain."
            case "Mountain":
                return "You have found the Spirit Stone. With it, you may reach the center of the camp."
            case "Camp":
                return "The Shaman's Feather is in your hands. Only the Sacred Fire remains."
            case "Fire":
                return "The Ritual Mask is found. The path to the Spirit Realm is now open."
            case "Cave":
                return "The Memory Stone has awakened ancient power. Your path leads to the Forest of Shadows."
            case "Forest":
                return "The Wolf Fang is yours. Go to the Windy Hill."
            case "Hill":
                return "The Wind Whistle sings in your hands. Your path leads to the Lake of Reflections."
            case "Lake":
                return "The Dreamcatcher is filled with ancient visions. Your journey will end at the Temple of Ancestors."
            case "Temple":
                return "You have obtained the Great Feather. The trial is complete."
            default:
                return ""
            }
        }
        
        return ""
    }
    
    func levelItemPosition(currentLevel: ITTPLevel) -> (x: CGFloat, y: CGFloat) {
        if let index = levels.firstIndex(where: { $0.name == currentLevel.name }) {
            switch levels[index].name {
            case "Field":
                return (x: 50, y: 20)
            case "River":
                return (x: 100, y: 200)
            case "Mountain":
                return (x: 100, y: 200)
            case "Camp":
                return (x: 300, y: -200)
            case "Fire":
                return (x: -400, y: 100)
            default:
                return (x: 1, y: 2)
            }
        }
        
        return (x: 1, y: 2)
    }
    
    func levelItem(currentLevel: ITTPLevel) {
        if let index = levels.firstIndex(where: { $0.name == currentLevel.name }) {
            levels[index].isPassed = true
        }
    }
    
    func currentLevelPassInfo(currentLevel: ITTPLevel) -> Bool {
        if let index = levels.firstIndex(where: { $0.name == currentLevel.name }) {
            return levels[index].isPassed
        }
        return false
    }
    
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
    var isActive: Bool
    var isPassed: Bool
}
