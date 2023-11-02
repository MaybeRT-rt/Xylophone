//
//  XylophoneModel.swift
//  Xylophone
//
//  Created by Liz-Mary on 01.11.2023.
//

import Foundation
import UIKit


class XylophoneModel {
    let nameButtons = ["A", "B", "C", "D", "E", "F", "G"]
    
    func getColor(for name: String) -> UIColor {
        switch name {
        case "A": return .systemRed
        case "B": return .systemOrange
        case "C": return .systemYellow
        case "D": return .systemGreen
        case "E": return .systemIndigo
        case "F": return .systemBlue
        case "G": return .systemPurple
        default: return .white
        }
    }
}
