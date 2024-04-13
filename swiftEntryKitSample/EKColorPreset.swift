//
//  Colors.swift
//  swiftEntryKitSample
//
//  Created by kenty on 2024/04/13.
//

import Foundation
import SwiftEntryKit

public struct EKColorPreset  {

    var name : String
    var color : EKColor
    
    var uiColor : UIColor
    
    init(name: String, uiColor: UIColor) {
        self.name = name
        self.uiColor = uiColor
        self.color = EKColor(uiColor)

    }
}

extension EKColorPreset: Hashable {
    
    public static func == (lhs: EKColorPreset, rhs: EKColorPreset) -> Bool {
        return lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

/// Convert the named UIColor to EKColor and make it a list
public let ekColorPreset: [EKColorPreset]  = [
    EKColorPreset(name: "black", uiColor: UIColor.black),
    EKColorPreset(name: "darkGray", uiColor: UIColor.darkGray),
    EKColorPreset(name: "lightGray", uiColor: UIColor.lightGray),
    EKColorPreset(name: "white", uiColor: UIColor.white),
    EKColorPreset(name: "gray", uiColor: UIColor.gray),
    EKColorPreset(name: "red", uiColor: UIColor.red),
    EKColorPreset(name: "green", uiColor: UIColor.green),
    EKColorPreset(name: "blue", uiColor: UIColor.blue),
    EKColorPreset(name: "cyan", uiColor: UIColor.cyan),
    EKColorPreset(name: "yellow", uiColor: UIColor.yellow),
    EKColorPreset(name: "magenta", uiColor: UIColor.magenta),
    EKColorPreset(name: "orange", uiColor: UIColor.orange),
    EKColorPreset(name: "purple", uiColor: UIColor.purple),
    EKColorPreset(name: "brown", uiColor: UIColor.brown),
    EKColorPreset(name: "clear", uiColor: UIColor.clear),
]
