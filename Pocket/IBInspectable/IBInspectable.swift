import UIKit

class IBInspectable: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.darkGray {
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet{
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.2 {
        didSet{
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setUpView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpView()
    }
    
    private func setUpView(){
        layer.cornerRadius = self.bounds.height / 2
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
