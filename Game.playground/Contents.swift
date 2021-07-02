import UIKit

var GLOBAL_PLAYER_ID: Int = 0
var GLOBAL_TEAM_ID: Int = 0

class Player{
    private var hp: Int
    private var damage: Int
    private let id: Int
    
    init(hp: Int, damage: Int, id: Int) {
        self.hp = hp
        self.damage = damage
        self.id = id
    }
    
    func getHp() -> Int{
        return hp
    }
    
    func increaseHp(hp: Int) -> Void{
        self.hp += hp
    }
    
    func getDamage() -> Int{
        return damage
    }
    
    func increaseDamage(damage: Int) -> Void{
        self.damage += damage
    }
    
    func getAttack(damage: Int) -> Void{
        hp -= damage
    }
    
    func getId() -> Int{
        return id
    }
    
    
}


class Team{
    private var players: [Player]
    private let id: Int
    
    init(players: [Player], id: Int){
        self.players = players
        self.id = id
    }
    
    func deletePlayer(player: Player){
        let indexOfPlayer: Int? = findIndexOfPlayer(player: player)
        
        if let index = indexOfPlayer{
            players.remove(at: index)
        }
    }
    
    private func findIndexOfPlayer(player: Player) -> Int?{
        for i in 0..<players.count{
            if(players[i].getId() == player.getId()){
                return i
            }
        }
        
        return nil
    }
    
    func getPlayers() -> [Player]{
        return players
    }
    
    func getId() -> Int{
        return id
    }
    
}


class Game{
    private var teams: [Team] = []
    
    func start(numberOfTeams: Int) -> Void{
        for _ in 0..<numberOfTeams{
            teams.append(makeTeam())
        }
        
        startGame()
    }
    
    private func makeTeam() -> Team{
        var result: [Player] = []
        
        for _ in 0..<5{
            let player: Player = Player(hp: 100, damage: 5, id: GLOBAL_PLAYER_ID)
            result.append(player)
            GLOBAL_PLAYER_ID += 1
        }
        
        GLOBAL_TEAM_ID += 1
        return Team(players: result, id: GLOBAL_TEAM_ID)
    }
    
    private func startGame() -> Void{
        while teams.count != 1{
            print("The round is starting!")
            getLoot()
            teamsBattle()
            print("The round ended!")
            print()
        }
        
        print("Team \(teams[0].getId()) is winner!")
        print("Game over!")
    }
    
    private func teamsBattle(){
        print()
        var indexesTeamsToDelete: [Int] = []
        var teamsToDelete: [Team] = []
        
        for i in 0..<teams.count{
            for player in teams[i].getPlayers(){
                let isHit: Int = Int.random(in: 0...1)
                
                if(isHit == 1){
                    var indexTeamToAttack: Int = Int.random(in: 0..<teams.count)
                    
                    while indexTeamToAttack == i || indexesTeamsToDelete.contains(indexTeamToAttack){
                        indexTeamToAttack = Int.random(in: 0..<teams.count)
                    }
                    
                    let indexPlayerToAttack: Int = Int.random(in: 0..<teams[indexTeamToAttack].getPlayers().count)
                    
                    let attackedPlayer: Player = teams[indexTeamToAttack].getPlayers()[indexPlayerToAttack]
                    attackedPlayer.getAttack(damage: player.getDamage())
                    print("Player with \(attackedPlayer.getId()) id got \(player.getDamage()) damage!")
                    
                    if(attackedPlayer.getHp() <= 0){
                        teams[indexTeamToAttack].deletePlayer(player: attackedPlayer)
                        print("Player with \(attackedPlayer.getId()) id is DEAD!")
                    }
                    
                    if(teams[indexTeamToAttack].getPlayers().count <= 0){
                        print("Team with \(teams[indexTeamToAttack].getId()) id is LOST!")
                        indexesTeamsToDelete.append(indexTeamToAttack)
                        teamsToDelete.append(teams[indexTeamToAttack])
                        break
                    }
                } else{
                    print("Player with \(player.getId()) id missed!")
                }
            }
        }
        
        for team in teamsToDelete{
            for i in 0..<teams.count{
                if(team.getId() == teams[i].getId()){
                    teams.remove(at: i)
                    break
                }
            }
        }
        
        print()
    }
    
    private func getLoot() -> Void{
        print()
        
        for team in teams{
            for player in team.getPlayers(){
                let buff: Int = Int.random(in: 0...10)
                
                switch buff{
                case 8...10:
                    print("Warning! Player with \(player.getId()) id found a gun! The damage increased by 10 points!")
                    player.increaseDamage(damage: 10)
                    
                case 6...7:
                    print("Player with \(player.getId()) id found a stick! The damage increased by 5 points!")
                    player.increaseDamage(damage: 5)
                    
                case 3...5:
                    print("Player with \(player.getId()) id found a potion! The hp increased by 20 points!")
                    player.increaseHp(hp: 20)
                default:
                    break
                }
            }
        }
        
        print()
    }
}


var game = Game()
game.start(numberOfTeams: 5)
