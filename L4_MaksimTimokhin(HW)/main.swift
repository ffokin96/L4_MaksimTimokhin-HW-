//
//  main.swift
//  L3_TimokhinMaksim(HW)
//
//  Created by Максим Тимохин on 24.07.2020.
//  Copyright © 2020 Максим Тимохин. All rights reserved.
//

import Foundation

enum CarAction {
    case turnEngineOn
    case turnEngineOff
    case openWindow
    case closeWindow
    
    case spolerUp
    case spolerDown
    case truckLoad
    case truckUnLoad
    case speedUp
    case speedDowm
}


class Car {
    var color: Int
    var wheelCount: Int
    var isEngineOn: Bool = false
    var isWindowOn: Bool = true
    var isSpolerUp:Bool = true
    
    init (color: Int, wheelCount: Int) {
        self.color = color
        self.wheelCount = wheelCount
    }
    func carAction(action: CarAction) {
        switch action {
        case .turnEngineOff:
            guard isEngineOn else {
                print("Двигатель уже включен")
                return
            }
            isEngineOn = false
            
        case .turnEngineOn:
            guard !isEngineOn else {
                print("Двигатель уже выключен")
                return
            }
            isEngineOn = true
            
        case .openWindow:
            guard !isWindowOn else {
                print("Окна уже открыты")
                return
            }
            isWindowOn = false
            
        case .closeWindow:
            guard isWindowOn else {
                print("Окна уже закрыты")
                return
            }
            isWindowOn = true
            
            
        default:
            print("Данное действие на подходит для этого класса")
            return
        }
    }
}
class SportCar: Car {
    var isSpolerOn: Bool = true
    let maxSpeedLimit: Int = 252849
    var speed: Int = 0
    
    override func carAction(action: CarAction) {
        super.carAction(action: action)
        if action == .speedUp {
            speed = min(speed + 1, maxSpeedLimit)
            
        } else if action == .speedDowm {
            speed = max(speed - 1, 0)
        }
        
        switch action {
        case .spolerUp:
            guard isSpolerOn else {
                print("Сполер уже поднят")
                return
            }
            
            isSpolerOn = true
        case .spolerDown:
            guard !isSpolerOn else {
                print("Сполер уже опущен")
                return
            }
            isSpolerOn = false
            
        default:
            print("{херня}")
            return
        }
    }
}
    

class TrunkCar: Car {
    var trunkCappacity: Int
    var trunkIn: Int = 0
    
    init(cappacity: Int, wheelCount: Int, color: Int) {
        trunkCappacity = cappacity
        super.init(color: color, wheelCount: wheelCount)
    }
    
    override func carAction(action: CarAction) {
        super.carAction(action: action)
        
        if action == .truckLoad {
            trunkIn = min(trunkIn + 1, trunkCappacity )
        }
        else if action == .truckUnLoad {
            trunkIn = max(trunkIn - 1, 0)
            
        }
    }
}

let truck = TrunkCar(cappacity: 100, wheelCount: 16, color: 0x000000)
//truck.carAction(action: .turnEngineOn)
//truck.carAction(action: .truckLoad)
//truck.carAction(action: .openWindow)
let sportCar = SportCar(color: 0x738678, wheelCount: 4)


sportCar.carAction(action: .speedUp)
sportCar.carAction(action: .spolerDown)

print("Truck: в багажнике \(truck.trunkIn)кг, двигатель включен \(truck.isEngineOn)")
print("SportCar: окна \(sportCar.isWindowOn), сполер \(sportCar.isSpolerOn), скорость \(sportCar.speed)")
print("Cпасибо за внимание")

