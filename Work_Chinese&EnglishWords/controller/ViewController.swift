//
//  ViewController.swift
//  Work_Chinese&EnglishWords
//
//  Created by 彭有駿 on 2022/4/26.
//

import UIKit

//設定列舉來表示中文英文問題
enum QAMode{
    case ChineseWord
    case EnglishWord
}

class ViewController: UIViewController {
    

    @IBOutlet weak var chineseButton: UIButton!
    
    @IBOutlet weak var englishButton: UIButton!
    
    
    //ChineseQuestion-File中的資料
    let CtextQuestion = CHQuestionData()
    
    //EnglishQuestion-File中的資料
    let EtextQuestion = ENQuestionData()
    
    //QuestionStruct-File中的資料->問題需要的型別
    var tenQuestions = [Question]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        chineseButton.clipsToBounds = true
        englishButton.clipsToBounds = true
        
        
        
    }

    
    //拉SegueAction(中文成語Button)至ChineseViewController
    @IBSegueAction func chineseWords(_ coder: NSCoder) -> ChineseViewController? {
        total(mode: .ChineseWord)//做一個func
        //將資料傳至ChineseViewController
        let controller = ChineseViewController(coder: coder)
        controller?.CtextQuestion = tenQuestions
        //將問題淨空->防止累加
        tenQuestions.removeAll()
        return controller
        
    }
    
    //拉SegueAction(英文成語Button)至EnglishViewController(比照ChineseViewController)
    @IBSegueAction func englishWords(_ coder: NSCoder) -> EnglishViewController? {
        total(mode: .EnglishWord)
        let controller = EnglishViewController(coder: coder)
        controller?.textQuestion = tenQuestions
        tenQuestions.removeAll()
        return controller
    }
    
    
    
    //製作問題->並且使用shuffle()將問題裡的array[]打散
    func total(mode: QAMode){
        switch mode {
        case .ChineseWord:
            CtextQuestion.CHQuestions.shuffle()
            for question in 0...9 {
                tenQuestions.append(CtextQuestion.CHQuestions[question])//
            }
        case .EnglishWord:
            EtextQuestion.ENQuestions.shuffle()
            for question in 0...9{
                tenQuestions.append(EtextQuestion.ENQuestions[question])
            }
        }
       
    }
    
    
    
    
}

