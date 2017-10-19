//
//  ViewController.swift
//

import Foundation
import AVFoundation
import UIKit
import AVKit

class ViewController: UIViewController {
    var videoURL: NSURL = Bundle.main.url(forResource: "broad_city", withExtension: "mp4")! as NSURL
    var movieTitle:String = ""
    var playerController:AVPlayerViewController?
    
    @IBOutlet weak var videoInfo: UIView!
    
    @IBAction func pizza(_ sender: AnyObject) {
        print("PlayBtnTapped")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playerController = AVPlayerViewController()
        playerController?.player = AVPlayer()
        
        self.addChildViewController(playerController!)
        
        self.view.addSubview((playerController?.view)!)
        
        playerController?.didMove(toParentViewController: self)
        
        playerController?.view.frame = self.view.frame
        
        playerController?.view.addSubview(videoInfo)
        
        playerController?.player = AVPlayer(url: videoURL as URL)
        playerController?.player?.play()
        
        // playerController?.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDone), name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: playerController?.player?.currentItem)
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.videoInfo.frame = self.view.bounds
    }

    func videoDone(){
        print("DONE")
        dismiss(animated: true, completion: nil)
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

