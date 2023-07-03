//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    // var storyboard: UIStoryBoard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController() // 메모리에 올려놓기!
        
        firstVC.someString = "아기상어"
        
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil) // 다음 화면으로 이동!
        
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier:
            "secondVC") as? SecondViewController else { return } // 타입캐스팅
        
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.someString = "아빠상어"
        
        present(secondVC, animated: true, completion: nil)
    }
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        // 세그웨이 활성화
        performSegue(withIdentifier: "toThirdVC", sender: self)
        
    }
    
    // 세그웨이 방식의 데이터 전달 (prepare segue 메서드: 재정의)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" { // 먼저 identifier를 확인하고
            let thirdVC = segue.destination as! ThirdViewController // 타입캐스팅해서 담아주기 -> thirdVC에 접근 가능
            
            // 데이터 전달
            thirdVC.someString = "엄마상어"
        }
        
        if segue.identifier == "toFourthVC" { // 먼저 identifier를 확인하고
            let fourthVC = segue.destination as! FourthViewController // 타입캐스팅해서 담아주기 -> fourthVC에 접근 가능
            
            // 데이터 전달
            fourthVC.someString = "뚜루루뚜뚜"
        }
    }
    
    var num = 7
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if num < 5 {
            return false
        }
        else {
            return true
        }
    }
    
}

