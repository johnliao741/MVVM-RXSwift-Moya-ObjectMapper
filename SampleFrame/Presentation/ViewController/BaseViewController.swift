//
//  BaseViewController.swift
//  SampleFrame
//
//  Created by John on 2023/5/10.
//

import Foundation
import UIKit
class BaseViewController:UIViewController{
    var loadingAlert :UIAlertController?
    override func viewDidLoad() {
        
    }
}
extension BaseViewController{
   
    func showMessage(
        title:String? = nil,
        message:String,
        confirmBtn:String? = nil,
        cancelBtn:String? = nil,
        confirmAction:((UIAlertAction)->Void)? = nil,
        cancelAction:((UIAlertAction)->Void)? = nil
    ){
        let controller = UIAlertController( title: title, message: message, preferredStyle: .alert)
          let okAction = UIAlertAction(title: confirmBtn ?? "OK", style: .default, handler: confirmAction)
          controller.addAction(okAction)
        if let _ = cancelAction {
            let cancelAction = UIAlertAction(title: cancelBtn ?? "取消", style: .cancel,handler: cancelAction)
            controller.addAction(cancelAction)
        }
        self.present(controller, animated: true)
    }
    func showLoading(_ text:String? = nil){
        loadingAlert = UIAlertController(title: nil, message: text ?? "讀取中...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating()

        loadingAlert?.view.addSubview(loadingIndicator)
        
        self.present(loadingAlert!, animated: false, completion: nil)
    }
    func dismiss(){
        loadingAlert?.dismiss(animated: false)
        loadingAlert = nil
    
    }
}
