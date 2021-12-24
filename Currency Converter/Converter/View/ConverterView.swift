//
//  ConverterV.swift
//  Currency Converter
//
//  Created by Preeteesh Remalli on 23/12/21.
//

import UIKit

@IBDesignable class ConverterViewWrapper : NibWrapperView<ConverterView> { }

class ConverterView: UIView {
    @IBOutlet weak var currencyCode: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var currentValue: UILabel!
    @IBOutlet weak var addCurrency: UIButton!
    
    var code : String = "" {
        didSet { currencyCode.text = code }
    }
    var flag = Data() {
        didSet {
            countryFlag.image = UIImage(data: flag) }
    }
    var value : String = "" {
        didSet { currentValue.text = value }
    }
    var configureDefaultView : CountryVM? {
        didSet {
            self.currencyCode.text = configureDefaultView?.currencyCode
            self.countryFlag.image = UIImage(data: configureDefaultView!.flag)
            self.currentValue.text = "0.0"
        }
    }
}

extension UIView {
    /// Load the view from a nib file called with the name of the class
    ///
    /// - Note: The first object of the nib file **must** be of the matching class
    static func loadFromNib() -> Self {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}
class NibWrapperView<T: UIView>: UIView {
    /// The view loaded from the nib
    var contentView: T
    
    required init?(coder: NSCoder) {
        contentView = T.loadFromNib()
        super.init(coder: coder)
        prepareContentView()
    }
    
    override init(frame: CGRect) {
        contentView = T.loadFromNib()
        super.init(frame: frame)
        prepareContentView()
    }
    
    private func prepareContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        contentView.prepareForInterfaceBuilder()
    }
}
