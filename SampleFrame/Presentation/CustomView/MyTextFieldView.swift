//
//  MyTextFieldView.swift
//  SampleFrame
//
//  Created by John on 2023/5/18.
//

import UIKit
@IBDesignable
class MyTextFieldView: UIView,NibOwnerLoadable{
    @IBInspectable var actionType :UIReturnKeyType = UIReturnKeyType.default{
        didSet{
            textField.returnKeyType = actionType
        }
    }
    @IBInspectable var textInputType:UIKeyboardType = UIKeyboardType.default{
        didSet{
            textField.keyboardType = textInputType
        }
    }
    @IBInspectable var hint:String = "" {
        didSet{
            textField.placeholder = text
        }
    }
    @IBInspectable var text:String = "" {
        didSet{
            textField.text = text
        }
    }
    @IBInspectable var image:UIImage? = nil {
        didSet{
            if let image = image{
                img.image = image
            }
        }
    }
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var img: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        customInit()
    }
    private func customInit(){
        loadNibContent()
        textField.text = text
        textField.placeholder = hint
        if let image = image{
            img.image = image
        }
        textField.keyboardType = textInputType
        textField.returnKeyType = actionType
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 20
        textField.setLeftPaddingPoints(15)
        textField.setRightPaddingPoints(15)
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        textField.text = text
        textField.placeholder = hint
        textField.keyboardType = textInputType
        textField.returnKeyType = actionType
        if let image = image{
            img.image = image
        }
    }
   

}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
