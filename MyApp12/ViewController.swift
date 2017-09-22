//
//  ViewController.swift
//  MyApp12
//
//  Created by user22 on 2017/9/22.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var i = 0, j = 0
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    let queue1 = DispatchQueue(label: "tw.org.iii.q1")
    let queue2 = DispatchQueue(label: "tw.org.iii.q2")
    let queue3 = DispatchQueue(label: "tw.org.iii.q3", qos: DispatchQoS.userInteractive )
    let queue4 = DispatchQueue(label: "tw.org.iii.q4", attributes: .concurrent)
//    let queue4 = DispatchQueue(label: "tw.org.iii.q4")
    
    @IBAction func test1(_ sender: Any) {
        queue4.async {
            self.job1()
        }
        queue4.async {
            self.job2()
        }
        queue4.async {
            self.job3()
        }
    }
    
    func job1(){
        for i in 1...30 {
            print("job1:\(i)")
        }
    }
    func job2(){
        for i in 1...30 {
            print("job2:\(i)")
        }
    }
    func job3(){
        for i in 1...30 {
            print("job3:\(i)")
        }
    }
    

    @IBAction func test2(_ sender: Any) {
        queue4.async {
            for i in 1...10 {
                print("A:\(i)")
                DispatchQueue.main.async {
                    self.label2.text = "\(i)"
                }
                sleep(1)
            }
        }
    }
    
    @IBAction func test3(_ sender: Any) {
        queue4.async {
            for i in 1...10 {
                print("B:\(i)")
                DispatchQueue.main.async {
                    self.label3.text = "\(i)"
                }
                //sleep(1)
                usleep(1000000)  // 百萬分之一秒 1000000 = 1s
            }
        }
    }
    

    @IBAction func test4(_ sender: Any) {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){
            (timer) in
            self.task1(timer: timer)
        }
    }
    
    func task1(timer: Timer) {
        i += 1
        
        if i >= 20 {
            timer.invalidate()
            i = 0
        }else {
            print("task1: \(i)")
            label4.text = "\(i)"
        }
        
    }
    
    @IBAction func test5(_ sender: Any) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (_) in
            self.task2()
        }
    }
    func task2() {
        j += 1
        print("task2: \(j)")
        label5.text = "\(j)"
    }

    
}

