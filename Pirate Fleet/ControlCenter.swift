//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let smallShip1 = Ship( length: 2, location: GridLocation(x: 4, y: 0), isVertical: true)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x:0, y:0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 4, y: 2), isVertical: false)
        let largeShip1 = Ship(length: 4, location: GridLocation(x: 0, y: 5), isVertical: false)
        let xlargeShip1 = Ship(length: 5, location: GridLocation(x: 0, y: 6), isVertical: false)
        let mine1 = Mine(location: GridLocation(x: 4, y: 5), explosionText: "Boom!")
        let mine2 = Mine(location: GridLocation(x: 4, y: 4), explosionText: "Ba-da-boom!")
        
        human.addShipToGrid(smallShip1)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip1)
        human.addShipToGrid(xlargeShip1)
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        let numberOfShips: Int = 5
        var finalScore: Int
        
        finalScore = ((numberOfShips - gameStats.enemyShipsRemaining) * gameStats.sinkBonus + (numberOfShips - gameStats.humanShipsSunk) *  gameStats.shipBonus - (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty)

        print("the value of final score is \(finalScore)")
        
        return finalScore
    }
}