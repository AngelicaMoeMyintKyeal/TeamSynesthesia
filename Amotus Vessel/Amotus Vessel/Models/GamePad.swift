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
//        var dPadLeft: GCControllerButtonInput?
//        var dPadRight: GCControllerButtonInput?
        var buttonA: GCControllerButtonInput?
        var buttonB: GCControllerButtonInput?
        var buttonX: GCControllerButtonInput?
        
//        weak var weakController = self
        
        guard let gamepad = gameController.extendedGamepad else {
            print("Error: the gamepad connected is not an extendedGamepad")
            return
        }
        
        dPadUp = gamepad.dpad.up
//        dPadLeft = gamepad.dpad.left
//        dPadRight = gamepad.dpad.right
        buttonA = gamepad.buttonA // Cross on Playstation
        buttonB = gamepad.buttonB // Circle on Playstation
        buttonX = gamepad.buttonX // Square on Playstation
        
        buttonA?.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
//            guard let strongController = weakController else {
//                return
//            }
            if pressed && self.delegate?.isJumping == false {
                print("jump")
                self.delegate?.jump()
            }
        }
        
        buttonB?.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
//            guard let strongController = weakController else {
//                return
//            }
            if pressed {
                print("attack")
//                strongController.controllerAttack()
            }
        }
        
        buttonX?.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
//            guard let strongController = weakController else {
//                return
//            }
            if pressed {
                print("dash")
            }
        }
        
        dPadUp?.pressedChangedHandler = buttonA?.pressedChangedHandler
    }
}

protocol InputDelegate: AnyObject {
    var isJumping: Bool { get }
    func jump()
}
