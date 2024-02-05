//
//  ViewController.swift
//  MatchDemo
//
//  Created by Ahmed Abo Elsood on 05/02/2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var matchesTableView: UITableView!
    
    //MARK: - Variables
    
    var matches: [Match] = []
    var timer : Timer?
    
    //MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMatches()
        matchesTableView.delegate = self
        matchesTableView.dataSource = self
        matchesTableView.register(UINib(nibName: "MatcheCell", bundle: nil), forCellReuseIdentifier: "MatcheCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        stopTimer()
    }
    
    //MARK: - Methods
    
    @objc private func appWillEnterForeground() {
        startTimer()
    }
    
    @objc private func appDidEnterBackground() {
        stopTimer()
    }
    
    private func startTimer(){
        let currentDate = Date()
        
        if !matches.allSatisfy({ $0.startTime.timeIntervalSince(currentDate) <= 0 }) {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateRemainingTime), userInfo: nil, repeats: true)
        }
    }
    
    private func stopTimer(){
        guard let timer = timer else {return}
        timer.invalidate()
        self.timer = nil
    }
    
    private func fetchMatches() {
        matches = Match.createSampleData()
    }
    
    @objc private func updateRemainingTime() {
        print("updated")
        matchesTableView.reloadData()
    }
    
    //MARK: - IBActions
    
    @IBAction func nav(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondOne") as? SecondOne {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatcheCell", for: indexPath) as! MatcheCell
        let match = matches[indexPath.row]
        cell.configure(with: match)
        return cell
    }
}
