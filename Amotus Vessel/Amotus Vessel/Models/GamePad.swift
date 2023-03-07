//
//  GamePad.swift
//  Amotus Vessel
//
//  Created by Pierpaolo Siciliano on 01/03/23.
//

import GameController

class GamePad {
    weak var delegate: InputDelegate?
    
    var movementDirection: GCControllerDirectionPad?
    
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
        guard let gameController = notification.object as? GCController else { return }
        print("controller connected")
        registerGameController(gameController)
    }
    
    @objc
    func handleControllerDidDisconnect(_ notification: Notification) {
        guard let gameController = notification.object as? GCController else { return }
        print("controller disconnected")
        unregisterGameController(gameController)
    }
    
    func registerGameController(_ gameController: GCController) {
        guard let gamepad = gameController.extendedGamepad else {
            print("Error: the gamepad connected is not an extendedGamepad")
            return
        }
        
        self.movementDirection = gamepad.dpad
        let dPadUp = gamepad.dpad.up
        let buttonA = gamepad.buttonA // Cross on Playstation
        let buttonB = gamepad.buttonB // Circle on Playstation
        
        dPadUp.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            if pressed && self.delegate?.isJumping == false {
                print("jump")
                self.delegate?.jump()
            }
        }
        
        buttonA.pressedChangedHandler = dPadUp.pressedChangedHandler
        
        buttonB.pressedChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            if pressed && self.delegate?.isAttacking == false {
                print("attack")
                self.delegate?.attack()
            }
        }
    }
    
    func unregisterGameController(_ gameController: GCController) {
        movementDirection = nil
    }
}

protocol InputDelegate: AnyObject {
    var isJumping: Bool { get }
    var isAttacking: Bool { get }
    
    func jump()
    func attack()
}
