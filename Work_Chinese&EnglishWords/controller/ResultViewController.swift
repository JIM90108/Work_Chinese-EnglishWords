//
//  ResultViewController.swift
//  Work_Chinese&EnglishWords
//
//  Created by 彭有駿 on 2022/4/26.
//

import UIKit

class ResultViewController: UIViewController {
    var finalScore:Int?
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showResult()
    }
    
    func showResult(){
        if let finalScore = finalScore {
            scoreLabel.text = "\(finalScore)"
            switch finalScore{
            case 0..<60:
                ResultLabel.text = "你還太淺了"
            case 60..<80:
                ResultLabel.text = "還行還行！"
            case 80..<100:
                ResultLabel.text = "不錯不錯！"
            case 100:
                ResultLabel.text = "達人"
            default:
                return
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
