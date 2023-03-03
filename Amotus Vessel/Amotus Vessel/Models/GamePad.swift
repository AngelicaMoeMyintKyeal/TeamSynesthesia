//
//  GamePad.swift
//  Amotus Vessel
//
//  Created by Pierpaolo Siciliano on 01/03/23.
//

import GameController

class GamePad {
    weak var delegate: InputDelegate?
    
    init() {
        setupObservers()
    }
    
    func setupObservers() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.handleControllerDidConnect),
            name: NSNotification.Name.GCControllerDidBecomeCurrent, object: nil)
        
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.handleControllerDidDisconnect),
            name: NSNotification.Name.GCControllerDidStopBeingCurrent, object: nil)
    }
    
    @objc
    func handleControllerDidConnect(_ notification: Notification) {
        guard let gameController = notification.object as? GCController else {
            return
        }
        print("controller connected")
        registerGameController(gameController)
    }
    
    @objc
    func handleControllerDidDisconnect(_ notification: Notification) {
        print("controller disconnected")
    }
    
    func registerGameController(_ gameController: GCController) {
        var dPadUp: GCControllerButtonInput?
        var dPadLeft: GCControllerButtonInput?
        var dPadRight: GCControllerButtonInput?
        var buttonA: GCControllerButtonInput?
        var buttonB: GCControllerButtonInput?
//        var buttonX: GCControllerButtonInput?
        
        guard let gamepad = gameController.extendedGamepad else {
            print("Error: the gamepad connected is not an extendedGamepad")
            return
        }
        
        dPadUp = gamepad.dpad.up
        dPadLeft = gamepad.dpad.left
        dPadRight = gamepad.dpad.right
        buttonA = gamepad.buttonA // Cross on Playstation
        buttonB = gamepad.buttonB // Circle on Playstation
//        buttonX = gamepad.buttonX // Square on Playstation
        
        dPadUp?.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            if pressed && self.delegate?.isJumping == false {
                print("jump")
                self.delegate?.jump()
            }
        }
        
        dPadLeft?.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            if pressed && self.delegate?.isMoving == false {
                print("move left")
                self.delegate?.move(direction: .left)
            }
        }
        
        dPadRight?.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            if pressed && self.delegate?.isMoving == false {
                print("move right")
                self.delegate?.move(direction: .right)
            }
        }
        
        buttonA?.pressedChangedHandler = dPadUp?.pressedChangedHandler
        
        buttonB?.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            if pressed && self.delegate?.isAttacking == false {
                print("attack")
                self.delegate?.attack()
            }
        }
    }
}

enum direction {
    case left
    case right
}

protocol InputDelegate: AnyObject {
    var isJumping: Bool { get }
    var isAttacking: Bool { get }
    var isMoving: Bool { get }
    
    func jump()
    func attack()
    func move(direction: direction)
}
