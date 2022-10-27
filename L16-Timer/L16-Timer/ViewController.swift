//
//  ViewController.swift
//  L16-Timer
//
//  Created by Galina Iaroshenko on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer:Timer = Timer()
    var count:Int = 0
    //var timerCounting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startAction(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                             target: self,
                                             selector: #selector(timerCounter),
                                             userInfo: nil,
                                             repeats: true)
    }
    
    @IBAction func stopAction(_ sender: Any) {
        timer.invalidate()
    }
    
    @objc func timerCounter() -> Void
        {
            count = count + 1
            let time = secondsToMinutes(seconds: count)
            let timeString = makeTimeString(minutes: time.1, seconds: time.0)
            timeLabel.text = timeString
        }
    
    func secondsToMinutes(seconds: Int) -> (Int, Int)
        {
            return (seconds / 60, seconds % 60)
        }
    
    func makeTimeString(minutes: Int, seconds : Int) -> String
        {
            var timeString = ""
            timeString += String(format: "%02d", seconds)
            timeString += " : "
            timeString += String(format: "%02d", minutes)
            return timeString
        }
}

