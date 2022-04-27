//
//  ChineseViewController.swift
//  Work_Chinese&EnglishWords
//
//  Created by 彭有駿 on 2022/4/26.
//

import UIKit

class ChineseViewController: UIViewController {
    
    //問題
    @IBOutlet weak var questionLabel: UILabel!
    //題號：問題1,問題2.....依此類推
    @IBOutlet weak var questionNumberLabel: UILabel!
    //分數
    @IBOutlet weak var scoreLabel: UILabel!
    //選擇按鈕[]array
    @IBOutlet var optionsButton: [UIButton]!
    
    //接受ViewController設定的資料
    var CtextQuestion = [Question]()
    //QAModel中設定類別->並抓取出來
    let game = Game()
    //得分
    var score:Int = 0{
        didSet{
            scoreLabel.text = "\(score)"
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設定Game()中裡的questions
        game.questions = CtextQuestion
        //更新問題
        game.updateQuestion()
        //更新畫面
        game.updateUI(questionTitle: questionLabel, questionNumber: questionNumberLabel, optionsButton: optionsButton)
        
        
        optionsButton[0].clipsToBounds = true
        optionsButton[1].clipsToBounds = true
        optionsButton[2].clipsToBounds = true
        optionsButton[3].clipsToBounds = true
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    //四個選項Button
    @IBAction func selectAnswer(_ sender: UIButton) {
        //設定Alert所需要的參數
        var titleString:String?
        var messageString:String?
        //設定tag寫一個checkAnswer()func->判斷得分條件
        if game.checkAnswer(tag: sender.tag) == true {
            score += 10
            titleString = "答對了"
            messageString = "恭喜～好棒棒～"
        }else{
            titleString = "答錯了..."
            messageString = "答案是"+game.answer
        }
        //判斷題目結束->並跳轉
        guard game.questionIndex < 9 else{
            alert(title:titleString!, message: messageString!) {
                self.performSegue(withIdentifier:"ChineseShowResult", sender: nil)
            }
            return
        }
        alert(title: titleString!, message: messageString!) {
            self.game.questionIndex += 1
            self.game.updateUI(questionTitle:self.questionLabel, questionNumber: self.questionNumberLabel, optionsButton: self.optionsButton)
        }
    }
    
    
    
    
    //接收score傳至ResultViewController
    @IBSegueAction func passScore(_ coder: NSCoder) -> ResultViewController? {
      let controller = ResultViewController(coder: coder)
        controller?.finalScore = score
        return controller
    }
    
    
    
    
    
    //@escaping表示這個方法結束之後還能使用
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
