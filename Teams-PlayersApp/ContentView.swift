//
//  ContentView.swift
//  Teams-PlayersApp
//
//  Created by عبدالله حافظ on 05/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = teamsViewModel()
    
    var body: some View
    {
        NavigationView {
            List {
                ForEach(viewModel.teams, id: \.id) { (team: Team) in
                    Section(header: Text("\(team.name) - \(team.type)")) {
                        ForEach(team.Players, id: \.id) { (player: player) in
                            VStack(alignment: .leading) {
                                Text("Name: \(player.name)")
                                Text("Age: \(player.age)")
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle("Teams")
        }
    }
}

class teamsViewModel: ObservableObject {
    @Published var teams: [Team] = []
    
    init() {
        let team1 = Team(
            name: "Taibah",
            type:  .National,
            Players: [
                player(name: "abdullah", age: 25),
                player(name: "naif", age: 22),
                player(name: "tahany", age: 24)
            ]
        )
        
        let team2 = Team(
            name: "atomcamp",
            type:  .Club,
            Players: [
                player(name: "Zohaib", age: 27),
                player(name: "muhammad", age: 26),
                player(name: "iqra", age: 29)
            ]
        )
        
        let team3 = Team(
            name: "elm",
            type:  .Club,
            Players: [
                player(name: "ahmed", age: 32),
                player(name: "nura", age: 31),
                player(name: "mohanad", age: 45)
            ]
        )
        
        teams = [team1, team2, team3]
    }
    
    func addPlayer(to team: Team, player: player) {
        if let index = teams.firstIndex(where : { $0.id == team.id }) {
            teams[index].Players.append(player)
        }
    }
    
    
}


#Preview {
    ContentView()
}
