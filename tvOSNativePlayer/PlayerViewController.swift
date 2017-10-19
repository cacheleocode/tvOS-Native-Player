//
//  PlayerViewController.swift
//  tvOSNativePlayer
//
//  Created by Martin Normark on 11/09/15.
//  Copyright © 2015 MilkshakeHQ. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController {
    let overlayView = UIView(frame: CGRect(x: 500, y: 500, width: 600, height: 600))
    
    /*
    @IBAction func upGesture(_ sender: UISwipeGestureRecognizer) {
        print("Swiped up")
    }
    
    
    @IBAction func downGesture(_ sender: UISwipeGestureRecognizer) {
        print("Swiped down")
    }
    
    
    @IBAction func leftGesture(_ sender: UISwipeGestureRecognizer) {
        print("Swiped left")
        player?.pause()
    }
    
    
    @IBAction func rightGesture(_ sender: UISwipeGestureRecognizer) {
        print("Swiped right")
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        print("Panned")
    }
    */
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        overlayView.backgroundColor=UIColor.orange
        overlayView.alpha=0.8
        overlayView.addSubview(UIImageView(image: UIImage(named: "tv-watermark")))
        contentOverlayView?.addSubview(overlayView)
        
        let videoURL: NSURL = Bundle.main.url(forResource: "broad_city", withExtension: "mp4")! as NSURL
        
        // player = AVPlayer(url: URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
        player = AVPlayer(url: videoURL as URL)
        
        player?.play()
        
        
        // swipe detection
      
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
     }
}
