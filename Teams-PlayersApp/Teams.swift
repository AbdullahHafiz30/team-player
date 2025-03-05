//
//  Teams.swift
//  Teams-PlayersApp
//
//  Created by عبدالله حافظ on 05/09/1446 AH.
//
import SwiftUI
// enum for the team types
enum TeamType{
    case National
    case Club
    case Academy
}
//class for craeting teams
class Team: Identifiable {
    let id: UUID
    let name: String
    let type: TeamType
    var Players: [player] = []
    
    init(id: UUID = UUID(), name: String, type: TeamType, Players: [player] = []) {
        self.id = id
        self.name = name
        self.type = type
        self.Players = Players
    }
    
}


