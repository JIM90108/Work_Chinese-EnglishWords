//
//  EnglishViewController.swift
//  Work_Chinese&EnglishWords
//
//  Created by 彭有駿 on 2022/4/26.
//

import UIKit

class EnglishViewController: UIViewController {
    
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    

    @IBOutlet var optionsButton: [UIButton]!
    

    //接受資料
    var textQuestion = [Question]()
    //遊戲
    let game = Game()
    //得分
    var score:Int = 0{
        didSet{
            scoreLabel.text = "\(score)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        game.questions = textQuestion
        game.updateQuestion()
        game.updateUI(questionTitle: questionLabel, questionNumber: questionNumberLabel, optionsButton: optionsButton)
        
        optionsButton[0].clipsToBounds = true
        optionsButton[1].clipsToBounds = true
        optionsButton[2].clipsToBounds = true
        optionsButton[3].clipsToBounds = true
        

        // Do any additional setup after loading the view.
}
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        var titleString:String?
        var messageString:String?
        if game.checkAnswer(tag: sender.tag) == true{
            score += 10
            titleString = "答對了"
            messageString = "恭喜～好棒棒～"
        }else{
            titleString = "答錯了..."
            messageString = "答案是"+game.answer
        }
        guard game.questionIndex < 9 else{
            alert(title:titleString!, message: messageString!) {
                self.performSegue(withIdentifier:"EnglishShowResult", sender: nil)
            }
            return
        }
        alert(title: titleString!, message: messageString!) {
            self.game.questionIndex += 1
            self.game.updateUI(questionTitle:self.questionLabel, questionNumber: self.questionNumberLabel, optionsButton: self.optionsButton)
        }

    }
    
    
    
    @IBSegueAction func passScore(_ coder: NSCoder) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
        controller?.finalScore = score
        return controller
    }
    
    
    
    
    func alert(title:String,message:String,handler:@escaping ()->()){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"Continue" , style: .default) { okAction in
            handler()
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
