//
//  QAModel.swift
//  Work_Chinese&EnglishWords
//
//  Created by 彭有駿 on 2022/4/26.
//


import Foundation
import UIKit

class Game{
    //接收題目
    var questions:[Question]?
    //文字題目
    var question:String?

    //答案
    var answer = ""
    //四個選項
    var options = [String]()
    //題號
    var questionIndex = 0{
        didSet{
            updateQuestion()
        }
    }
    //更新題目
    func updateQuestion(){
        if let questions = questions {
            question = questions[questionIndex].question
            answer = questions[questionIndex].answer
            options = questions[questionIndex].options
        }
        
    }
    //更新畫面
    func updateUI(questionTitle:UILabel?,questionNumber:UILabel,optionsButton:[UIButton]){
        questionTitle?.text = question
        questionNumber.text = "\(questionIndex+1)"
        options.shuffle()
        for (i,option) in optionsButton.enumerated(){
            option.configuration?.attributedTitle = AttributedString(options[i])
            option.configuration?.attributedTitle?.font = UIFont(name: "HanWangYenHeavy", size: 25)
        }
    }
   //判斷選項與選擇的答案是否一樣
    func checkAnswer(tag:Int)->Bool{
        if options[tag] == answer{
            return true
        }else{
            return false
        }
    }
}

