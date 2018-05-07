//
//  ViewController.swift
//  Distini
//
//  Created by Tran Thanh Bang on 5/7/18.
//  Copyright © 2018 Tran Thanh Bang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var storyTextLabel: UILabel!
    
    let allStory = StoryBank()
    var indexStory : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        loadStory()
    }
    
    func loadStory(){
        let story : Story = allStory.list[indexStory]
        storyTextLabel.text = story.storyText
        story.answer1.isEmpty ? topButton.isHidden = true : topButton .setTitle(story.answer1, for: .normal)
        story.answer2.isEmpty ? bottomButton.isHidden = true : bottomButton .setTitle(story.answer2, for: .normal)
        if indexStory > 2 {
            restartButton.isHidden = false
        }else{
            restartButton.isHidden = true
            topButton.isHidden = false
            bottomButton.isHidden = false
        }

    }
    
    @IBAction func onClickButton(_ sender: UIButton) {
        checkShowStory(indexStory: indexStory, andButtonTag: sender.tag)
    }
    
    @IBAction func onClickRestart(_ sender: UIButton) {
        restartTheStory()
    }
    
    func checkShowStory(indexStory index : Int, andButtonTag buttonTag : Int){
        if indexStory == 0 && buttonTag == 0{
            indexStory = 2
        }else if indexStory == 0 && buttonTag == 1{
            indexStory = 1
        }else if indexStory == 1 && buttonTag == 0{
            indexStory = 2
        }else if indexStory == 1 && buttonTag == 1{
            indexStory = 3
        }else if indexStory == 2 && buttonTag == 0{
            indexStory = 5
        }else if indexStory == 2 && buttonTag == 1{
            indexStory = 4
        }
        loadStory()
    }
    
    func restartTheStory(){
        indexStory = 0
        loadStory()
        restartButton.isHidden = true
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

