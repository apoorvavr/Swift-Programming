//
//  ViewController.swift
//  testConstraints
//
//  Created by Apoorva Revankar on 5/30/20.
//  Copyright © 2020 Apoorva Revankar. All rights reserved.
//

import UIKit

enum Operation : String {
    case noOp = "no operation"
    case addition = "addition"
    case subtraction = "subtraction"
    case multiplication = "multiplication"
    case division = "division"
}

class ViewController: UIViewController {
    
    var stack:[Double] = [-1.0, 0.0]
    var head: Int = 0;
    var op = Operation.noOp;
    
    @IBOutlet weak var resultDisplayView: UIView?
    @IBOutlet weak var numberPadDisplayView: UIView?
    @IBOutlet weak var resultLabel: UILabel?
    
    @IBOutlet weak var number0: UIButton?
    @IBOutlet weak var number1: UIButton?
    @IBOutlet weak var number2: UIButton?
    @IBOutlet weak var number3: UIButton?
    @IBOutlet weak var number4: UIButton?
    @IBOutlet weak var number5: UIButton?
    @IBOutlet weak var number6: UIButton?
    @IBOutlet weak var number7: UIButton?
    @IBOutlet weak var number8: UIButton?
    @IBOutlet weak var number9: UIButton?
    @IBOutlet weak var addition: UIButton?
    @IBOutlet weak var subtraction: UIButton?
    @IBOutlet weak var multiplication: UIButton?
    @IBOutlet weak var division: UIButton?
    @IBOutlet weak var percentage: UIButton?
    @IBOutlet weak var plusMinus: UIButton?
    @IBOutlet weak var reset: UIButton?
    @IBOutlet weak var decimal: UIButton?
    @IBOutlet weak var equality: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeCalculator();
    }
    
    func initializeNumberButton(button: UIButton?=nil) -> Void {
        let cornerRaduisSize: CGFloat = 39;
        button?.layer.cornerRadius = cornerRaduisSize;
        button?.backgroundColor = UIColor (
            red: (51.0/255.0),
            green: (51.0/255.0),
            blue: (51.0/255.0),
            alpha: (1.0)
        )
        
        button?.titleLabel?.font = UIFont(name:"Helvetica", size:32)
        button?.setTitleColor(UIColor.white, for: .normal)
        button?.setTitleColor(UIColor.white, for: .highlighted)
    }
    
    func initializeControlButton(button: UIButton?=nil) -> Void {
        let cornerRaduisSize: CGFloat = 39;
        button?.layer.cornerRadius = cornerRaduisSize;
        button?.backgroundColor = UIColor (
            red: (165.0/255.0),
            green: (165.0/255.0),
            blue: (165.0/255.0),
            alpha: (1.0)
        )
        
        button?.titleLabel?.font = UIFont(name:"Helvetica", size:32)
        button?.setTitleColor(UIColor.black, for: .normal)
        button?.setTitleColor(UIColor.black, for: .highlighted)
    }
    
    func initializeArthematicButton(button: UIButton?=nil) -> Void {
        let cornerRaduisSize: CGFloat = 39;
        button?.layer.cornerRadius = cornerRaduisSize;
        button?.backgroundColor = UIColor (
            red: (238.0/255.0),
            green: (153.0/255.0),
            blue: (60.0/255.0),
            alpha: (1.0)
        )
        
        button?.titleLabel?.font = UIFont(name:"Helvetica", size:32)
        button?.setTitleColor(UIColor.white, for: .normal)
        button?.setTitleColor(UIColor.white, for: .highlighted)
    }
    
    func initialalizeUI() -> Void {
        // Initialize Calculator buttons.
        initializeNumberButton(button: self.number0);
        initializeNumberButton(button: self.number1);
        initializeNumberButton(button: self.number2);
        initializeNumberButton(button: self.number3);
        initializeNumberButton(button: self.number4);
        initializeNumberButton(button: self.number5);
        initializeNumberButton(button: self.number6);
        initializeNumberButton(button: self.number7);
        initializeNumberButton(button: self.number8);
        initializeNumberButton(button: self.number9);
        initializeNumberButton(button: self.decimal);
        initializeControlButton(button: reset);
        initializeControlButton(button: plusMinus);
        initializeControlButton(button: percentage);
        initializeArthematicButton(button: division);
        initializeArthematicButton(button: multiplication);
        initializeArthematicButton(button: subtraction);
        initializeArthematicButton(button: addition);
        initializeArthematicButton(button: equality);
        
        // Set the result display view.
        self.resultDisplayView?.backgroundColor = UIColor.black;
        self.resultLabel?.text = "0";
        self.resultLabel?.isUserInteractionEnabled = false;
        
        // Set the number pad view.
        self.numberPadDisplayView?.backgroundColor = UIColor.black;
    }
    
    func initializeCalculator () -> Void {
        initialalizeUI()
    }
    
    func evaluate (number: Int64) -> Void {
        stack[1] = stack[1] * 10 + Double(number);
        head = 1;
        resultLabel?.text = String(NSInteger(stack[1]));
    }
    
    // Button actions
    @IBAction func button0Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 0 tapped");
        evaluate(number: 0);
    }
    
    @IBAction func button1Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 1 tapped");
        evaluate(number: 1);
    }
    
    @IBAction func button2Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 2 tapped");
        evaluate(number: 2);
    }
    
    @IBAction func button3Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 3 tapped");
        evaluate(number: 3);
    }
    
    @IBAction func button4Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 4 tapped");
        evaluate(number: 4);
    }
    
    @IBAction func button5Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 5 tapped");
        evaluate(number: 5);
    }
    
    @IBAction func button6Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 6 tapped");
        evaluate(number: 6);
    }
    
    @IBAction func button7Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 7 tapped");
        evaluate(number: 7);
    }
    
    @IBAction func button8Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 8 tapped");
        evaluate(number: 8);
    }
    
    @IBAction func button9Tapped(_ sender: UIButton) {
        NSLog("%@", "Button 9 tapped");
        evaluate(number: 9);
    }
    
    @IBAction func buttonAdditionTapped(_ sender: UIButton) {
        NSLog("%@", "Button Addition tapped");
        op = Operation.addition;
        if (head == 1) {
            stack[0] = (stack[0] == -1) ? stack[1] : stack[0] + stack[1];
            stack[1] = 0;
            head = 0;
            resultLabel?.text = String(NSInteger(stack[head]));
        }
    }
    
    @IBAction func buttonSubtractionTapped(_ sender: UIButton) {
        NSLog("%@", "Button Subtraction tapped");
        op = Operation.subtraction;
        if (head == 1) {
            stack[0] = (stack[0] == -1) ? stack[1] : stack[0] - stack[1];
            stack[1] = 0;
            head = 0;
            resultLabel?.text = String(NSInteger(stack[head]));
        }
    }
    
    @IBAction func buttonMultiplicationTapped(_ sender: UIButton) {
        NSLog("%@", "Button Multiplication tapped");
        op = Operation.multiplication;
        if (head == 1) {
            stack[0] = stack[0] == -1 ? stack[1] : stack[0] * stack[1];
            stack[1] = 0;
            head = 0;
            resultLabel?.text = String(NSInteger(stack[head]));
        }
    }
    
    @IBAction func buttonDivisionTapped(_ sender: UIButton) {
        NSLog("%@", "Button Division tapped");
        op = Operation.division;
        if (head == 1) {
            let shouldBeFloatValue: Bool = (stack[0] == -1) ? false : true;
            stack[0] = (stack[0] == -1) ? stack[1] : stack[0] / stack[1];
            stack[1] = 0;
            head = 0;
            if (shouldBeFloatValue) {
                resultLabel?.text = String(Float(stack[head]));
            } else {
                resultLabel?.text = String(Int(stack[head]));
            }
        }
    }
    
    @IBAction func buttonResetTapped(_ sender: UIButton) {
        NSLog("%@", "Button Reset tapped");
        op = Operation.noOp;
        stack[0] = -1.0
        stack[1] = 0.0
        head = 0;
        resultLabel?.text = "0";
    }
    
    @IBAction func buttonDecimalTapped(_ sender: UIButton) {
        NSLog("%@", "Button Decimal tapped");
    }
    
    @IBAction func buttonEqualityTapped(_ sender: UIButton) {
        NSLog("%@", "Button Equality tapped");
        if (op == Operation.addition) {
            buttonAdditionTapped(self.addition!)
        } else if (op == Operation.subtraction) {
            buttonSubtractionTapped(self.subtraction!)
        } else if (op == Operation.multiplication) {
            buttonMultiplicationTapped(self.multiplication!)
        } else if (op == Operation.division){
            buttonDivisionTapped(self.division!);
        }
    }
    
    @IBAction func buttonPlusMinusTapped(_ sender: UIButton) {
        NSLog("%@", "Button PlusMinus tapped");
        if (head == 1) {
            stack[1] = (stack[1] > 0) ? -1 * abs(stack[1]) : abs(stack[1]);
            resultLabel?.text = String(NSInteger(stack[1]));
        } else {
            stack[0] = (stack[0] > 0) ? -1 * abs(stack[0]) : abs(stack[0]);
            resultLabel?.text = String(NSInteger(stack[0]));
        }
    }
    
    @IBAction func buttonPercentageTapped(_ sender: UIButton) {
        NSLog("%@", "Button Percentage tapped");
        stack[0] = (stack[0] == -1) ? stack[1] / 100.0 : (stack[0] + stack[1]) / 100.0;
        stack[1] = 0;
        head = 0;
        resultLabel?.text = String(Float(stack[head]));
    }
}

