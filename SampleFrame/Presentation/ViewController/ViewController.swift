//
//  ViewController.swift
//  SampleFrame
//
//  Created by John on 2023/5/9.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: BaseViewController {

    @IBOutlet weak var password: MyTextFieldView!
    @IBOutlet weak var account: MyTextFieldView!
    @IBOutlet weak var display: UILabel!
    private let viewModel = ViewModel()
    private let dispose = DisposeBag()
    @IBAction func loginAction(_ sender: UIButton) {
        viewModel.login(account: account.textField.text!, password: password.textField.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModelListener()
        
    }
    override func viewDidAppear(_ animated: Bool) {

       
    }
    func initView(){
        account.actionType = UIReturnKeyType.next
        account.textInputType = UIKeyboardType.phonePad
        password.actionType = UIReturnKeyType.done
        password.textInputType = UIKeyboardType.default
        password.textField.isSecureTextEntry = true
    }
    func initViewModelListener(){
        viewModel.loginResponse
            .subscribe(
                onNext: { result in
                    self.dismiss()
                    switch result{
                    case .Error(let error):
                        self.showMessage(
                            title: "提示",
                            message: error.message,
                            confirmAction: { _ in
                                print("confirm")
                            },
                            cancelAction: { _ in
                                print("cancel")
                            })
                    case .Success(let data):
                        self.display.text = data.message ?? "登入成功"
                      
                    case .Loading(text: let text):
                
                        self.showLoading(text)
                    }
                }
            ).disposed(by: dispose)
    }
    
    
}

