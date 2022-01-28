//
//  ViewController.swift
//  FinalCalculator
//
//  Created by Umka on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var calculatorOperation: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var operation : String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll(){
        operation = ""
        calculatorOperation.text = ""
        calculatorResult.text = ""
    }
    
    func addToOperation(value : String){
        operation = operation + value
        calculatorOperation.text = operation
    }
    

    @IBAction func clearButton(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backTapButton(_ sender: Any) {
        
        if(!operation.isEmpty){
            operation.removeLast()
            calculatorOperation.text = operation
        }
        
    }
    
    @IBAction func percentButton(_ sender: Any) {
        addToOperation(value: "%")
    }
    
    @IBAction func divideButton(_ sender: Any) {
        addToOperation(value: "/")

    }
    
    @IBAction func multiplButton(_ sender: Any) {
        addToOperation(value: "*")

    }
    
    @IBAction func minusButton(_ sender: Any) {
        addToOperation(value: "-")

    }
    
    @IBAction func plusButton(_ sender: Any) {
        addToOperation(value: "+")

    }
    
    @IBAction func equalsButton(_ sender: Any) {
        
        if (validInput()) {
            
        let checkedOperationForPercent = operation.replacingOccurrences(of: "%", with:"*0.01")
        let expression = NSExpression(format: checkedOperationForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        calculatorResult.text = resultString
                          }
        else {
            let alert = UIAlertController(title: "Invalid input", message: "New laws of math?)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
               }
        }
    
    func validInput() -> Bool{
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in operation {
            if(specialChar(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            
            if(index == 0)
            {
                return false
            }
            
            if(index == operation.count - 1)
            {
                return false
            }
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialChar (char : Character) -> Bool
    {
        if (char == "×")
        {
            return true
        }
        if (char == "÷")
        {
            return true
        }
        if (char == "+")
        {
            return true
        }
       
        return false
    }
    
    func formatResult(result: Double) -> String{
        
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func decimalButton(_ sender: Any) {
        addToOperation(value: ".")

    }
    
    @IBAction func zeroButton(_ sender: Any) {
        addToOperation(value: "0")

    }
    
    @IBAction func oneButton(_ sender: Any) {
        addToOperation(value: "1")

    }
    
    @IBAction func twoButton(_ sender: Any) {
        addToOperation(value: "2")

    }
    
    @IBAction func threeButton(_ sender: Any) {
        addToOperation(value: "3")

    }
    
    @IBAction func fourButton(_ sender: Any) {
        addToOperation(value: "4")

    }
    
    @IBAction func fiveButton(_ sender: Any) {
        addToOperation(value: "5")

    }
    
    @IBAction func sixButton(_ sender: Any) {
        addToOperation(value: "6")

    }
    
    @IBAction func sevenButton(_ sender: Any) {
        addToOperation(value: "7")

    }
    
    @IBAction func eightButton(_ sender: Any) {
        addToOperation(value: "8")

    }
    
    @IBAction func nineButton(_ sender: Any) {
        addToOperation(value: "9")

    }
    
    
}

