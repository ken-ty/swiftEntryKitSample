//
//  EKAttributePreset.swift
//  swiftEntryKitSample
//
//  Created by kenty on 2024/04/13.
//

import Foundation
import SwiftEntryKit


public struct EKAttributePreset  {

    var name : String
    var attributes : EKAttributes
    
    init(name: String, attributes: EKAttributes) {
        self.name = name
        self.attributes = attributes
    }
}

extension EKAttributePreset: Hashable {
    
    public static func == (lhs: EKAttributePreset, rhs: EKAttributePreset) -> Bool {
        return lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

/// EKAttributes+Presets.swift の var を list 化した
public let ekAttributesPresets: [EKAttributePreset]  = [
    EKAttributePreset(name: "default", attributes: EKAttributes()),
    EKAttributePreset(name: "toast", attributes: EKAttributes.toast),
    EKAttributePreset(name: "float", attributes: EKAttributes.float),
    EKAttributePreset(name: "topFloat", attributes: EKAttributes.topFloat),
    EKAttributePreset(name: "bottomFloat", attributes: EKAttributes.bottomFloat),
    EKAttributePreset(name: "centerFloat", attributes: EKAttributes.centerFloat),
    EKAttributePreset(name: "bottomToast", attributes: EKAttributes.bottomToast),
    EKAttributePreset(name: "topToast", attributes: EKAttributes.topToast),
    EKAttributePreset(name: "topNote", attributes: EKAttributes.topNote),
    EKAttributePreset(name: "bottomNote", attributes: EKAttributes.bottomNote),
    EKAttributePreset(name: "statusBar", attributes: EKAttributes.statusBar),
]

