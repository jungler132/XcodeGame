//
//  ViewController.swift
//  mousedogcat
//
//  Created by student on 19.11.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var empty : String = ""
    var  player_score_count = 0
    var ai_score_count = 0
    var limit : Bool = false
    @IBOutlet weak var ai_card: UIImageView!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var player_card: UIImageView!
    @IBOutlet weak var player_score: UILabel!
    @IBOutlet weak var ai_score: UILabel!
    @IBOutlet weak var start_button: UIButton!
    @IBOutlet weak var restart_button: UIButton!
    
    @IBAction func Restart_button(_ sender: UIButton) {
        
        player_card.image = UIImage (imageLiteralResourceName: "back")
        ai_card.image = UIImage (imageLiteralResourceName: "back")
        
        player_score.text = "0"
            ai_score.text = "0"
        player_score_count = 0
        ai_score_count = 0
        limit = false
        msg.text = ""
    }
    
    
    
    
    
    
    func generateValue()->Int{
        return Int.random(in: 1...3)    }
    @IBAction func Start_button(_ sender: UIButton) {
        if limit == false
        {
        var player_card_type = generateValue()
        var ai_card_type = generateValue()
        
        player_card.image = UIImage (imageLiteralResourceName: "card\(player_card_type)")
        ai_card.image = UIImage (imageLiteralResourceName: "card\(ai_card_type)")
        
        if player_card_type == 1 {
            if player_card_type != ai_card_type{
                player_score_count += 1
                player_score.text = String(player_score_count)
            }
            if player_card_type == ai_card_type {
                msg.text = "draw"
            }
            if player_score_count >= 20 {
                limit = true
            }
        }
        if player_card_type == 2 {
            if player_card_type == ai_card_type {
                msg.text = "draw"
            }
            if player_card_type > ai_card_type {
                msg.text = "Player wins the round"
                player_score_count += 2
                player_score.text = String(player_score_count)
            }
            
            if player_score_count >= 20 {
                limit = true
            }
        }
        if player_card_type == 3 {
            if player_card_type == ai_card_type {
                msg.text = "draw"
            }
            if player_card_type > ai_card_type {
                msg.text = "Player wins the round"
                player_score_count += 3
                player_score.text = String(player_score_count)
            }
            if player_score_count >= 20 {
                limit = true
            }
        }
        if ai_card_type == 1 {
            if ai_card_type != player_card_type{
                ai_score_count += 1
                ai_score.text = String(ai_score_count)
            }
            if player_card_type == ai_card_type {
                msg.text = "draw"
            }
            if player_card_type < ai_card_type {
                msg.text = "AI wins the round"
                ai_score_count += 1
                ai_score.text = String(ai_score_count)
            }
            if ai_score_count >= 20 {
                limit = true
            }
        }
        if ai_card_type == 2 {
            if player_card_type == ai_card_type {
                msg.text = "draw"
            }
            if player_card_type < ai_card_type {
                msg.text = "AI wins the round"
                ai_score_count += 2
                ai_score.text = String(ai_score_count)
            }
            if ai_score_count >= 20 {
                limit = true
            }
        }
        if ai_card_type == 3 {
            if player_card_type == ai_card_type {
                msg.text = "draw"
            }
            if player_card_type < ai_card_type {
                msg.text = "AI wins the round"
                ai_score_count += 3
                ai_score.text = String(ai_score_count)
            }
            if ai_score_count >= 20 {
                limit = true
            }
        }
    }
        else if limit == true {
            if player_score_count >= 20 {
                msg.text =  "Player wins the game"
            }
            else if ai_score_count >= 20 {
                msg.text = "AI wins the game"
            }
            else if player_score_count >= 20 && ai_score_count >= 20 {
                msg.text = "DRAW"
            }
        }
        
}
    
    
    
    
    
    
    
    
    
    
    
}

