//
//  GameViewController.swift
//  TouchGame
//
//  Created by cse on 2022/06/15.
//

import UIKit
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label: SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        //시작 화면에 hello 레이블 띄우기
        self.label = self.childNode(withName: "//HelloLabel") as? SKLabelNode
        if self.label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIN(withDuration: 2.0))
            
        }
    }
}

class GameViewController: UIViewController {
    
    var timer : Timer?
    var timeLeft = 60
    
    //게임 시간 1분으로 지정
    var timer = Timer.scheduledTimer(timeInterval: 1.0, target: GameViewController.self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)

    
    @IBOutlet var txtScore: UILabel!
    @IBOutlet var txtBonus: UILabel!
    @IBOutlet var lblTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //터치 시작
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch // 현재 발생한 터치를 가지고 옴
        
        txtScore.text = String(touch.tapCount)
        txtBonus.text = String(touches.count)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtScore.text = String(touch.tapCount)
        txtBonus.text = String(touches.count)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        txtScore.text = String(touch.tapCount)
        txtBonus.text = String(touches.count)
    }
    
    @objc func onTimerFires()
    {
        timeLeft -= 1
        lblTime.text = "\(timeLeft) seconds left"

        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
        }
    }
}
