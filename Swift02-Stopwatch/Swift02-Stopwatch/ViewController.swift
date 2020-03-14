//
//  ViewController.swift
//  Swift02-Stopwatch
//
//  Created by da ghua on 2020/3/14.
//  Copyright © 2020 da ghua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var startWatch = Stopwatch()
    var lapWatch = Stopwatch()
    
    let cellIdentifier = "CellIdentifier"
    
    var laps: [String] = []
    var isPlay: Bool = false
    
    @IBOutlet weak var mianTimeLabel: UILabel!
    @IBOutlet weak var lapTimeLabel: UILabel!
    @IBOutlet weak var lapButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timeTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let initButton: (UIButton) -> Void = { button in
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.backgroundColor = UIColor.white
        }
        
        initButton(startButton)
        initButton(lapButton)
        
        lapButton.isEnabled = false
    }

    @IBAction func startTimeAction(_ sender: Any) {
        if !isPlay {
            //点击开始
            startWatch.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector.updateMainTimerSEL, userInfo: nil, repeats: true)
            lapWatch.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector.updateLapTimerSEL, userInfo: nil, repeats: true)
            
            RunLoop.current.add(startWatch.timer, forMode: .common)
            RunLoop.current.add(lapWatch.timer, forMode: .common)
            
            lapButton.isEnabled = true
            isPlay = true
            updateButtonTitle(button: startButton, title: "Pause")
            updateButtonTitle(button: lapButton, title: "Lap")
        } else {
            //点击暂停
            startWatch.timer.invalidate()
            lapWatch.timer.invalidate()
            isPlay = false
            updateButtonTitle(button: startButton, title: "Start")
            updateButtonTitle(button: lapButton, title: "Reset")
        }
    }
    
    @IBAction func lapAction(_ sender: Any) {
        if isPlay {
            lapWatch.counter = 0
            if let tx = lapTimeLabel.text {
                laps.append(tx)
                timeTableView.reloadData()
            }
        } else {
            lapWatch.timer.invalidate()
            startWatch.timer.invalidate()
            startWatch.counter = 0
            lapWatch.counter = 0
            updateLabelText(label: lapTimeLabel, counter: 0.0)
            updateLabelText(label: mianTimeLabel, counter: 0.0)
            laps.removeAll()
            timeTableView.reloadData()
        }
    }
    
    @objc func startTimerAction() {
        startWatch.counter += 1
        updateLabelText(label: mianTimeLabel, counter: startWatch.counter)
    }
    
    @objc func lapTimerAction() {
        lapWatch.counter += 1
        updateLabelText(label: lapTimeLabel, counter: lapWatch.counter)
    }
    
    func updateLabelText(label: UILabel, counter: Double) {
        label.text = "\(counter)"
    }
    
    func updateButtonTitle(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = laps[indexPath.row]
        return cell
    }
}

// MARK: - 这种写法值得借鉴
extension Selector {
    static let updateMainTimerSEL = #selector(ViewController.startTimerAction)
    static let updateLapTimerSEL = #selector(ViewController.lapTimerAction)
}
