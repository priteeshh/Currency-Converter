//
//  ConverterVC.swift
//  Currency Converter
//
//  Created by Preeteesh Remalli on 23/12/21.
//

import UIKit

protocol CountrySelectionProtocal{
    func didCountrySelected(countryDetails: CountryVM)
}

class ConverterVC: UIViewController, CountrySelectionProtocal {
    @IBOutlet weak var keyBoardTextField: UITextField!
    @IBOutlet weak var fromView: UIView!
    var selectedView = 0
    var fromCountry : CountryVM?
    var toCountry : CountryVM?
    @IBOutlet weak var toView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        keyBoardTextField.becomeFirstResponder()
        keyBoardTextField.addTarget(self, action: #selector(ConverterVC.textFieldDidChange(_:)),
                                    for: UIControl.Event.editingChanged)
        setDefaultValues()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        (toView as? ConverterViewWrapper)?.contentView.value = "0.0"
        keyBoardTextField.text = ""
    }
    
    func setDefaultValues(){
        var countriesArray : [CountryVM]?
        
        let countryVM = CountriesViewModel()
        countryVM.getCountriesList { countries in
            countriesArray = countries
            DispatchQueue.main.async {[self] in
                
                (fromView as? ConverterViewWrapper)?.contentView.configureDefaultView = countriesArray![225]
                fromCountry = countriesArray![225]
                
                (toView as? ConverterViewWrapper)?.contentView.configureDefaultView = countriesArray![96]
                toCountry = countriesArray![96]
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if textField.text != ""{
            (fromView as? ConverterViewWrapper)?.contentView.value = textField.text!
            convert(((fromView as? ConverterViewWrapper)?.contentView.currencyCode.text )!, ((toView as? ConverterViewWrapper)?.contentView.currencyCode.text)!, ((fromView as? ConverterViewWrapper)?.contentView.value)!)
            
        }else{
            (fromView as? ConverterViewWrapper)?.contentView.value = "0.0"
            (toView as? ConverterViewWrapper)?.contentView.value = "0.0"
        }
    }
    
    func convert(_ from: String, _ to: String, _ value: String){
        var finalValue = value
        if finalValue.last == "."{
            finalValue.removeLast()
        }
        let converterVM = ConverterViewModel()
        print(from+to+finalValue)
        converterVM.convert(from, to, finalValue) { res in
            DispatchQueue.main.async {
                (self.toView as? ConverterViewWrapper)?.contentView.value = res.value
            }
        }
        
    }
    
    @IBAction func fromSelectCountryTapped(_ sender: Any) {
        selectedView = 1
        buttonTapped()
    }
    
    @IBAction func toSelectCountryTapped(_ sender: Any) {
        selectedView = 2
        buttonTapped()
    }
    
    func buttonTapped(){
        performSegue(withIdentifier: "countrySegue", sender: nil)
    }
    
    @IBAction func swapButtonTapped(_ sender: Any) {
        
        let temp = fromCountry
        fromCountry = toCountry
        toCountry = temp
        let fromValue = (fromView as? ConverterViewWrapper)?.contentView.currentValue.text!
        if let from = fromCountry{
            (fromView as? ConverterViewWrapper)?.contentView.code = from.currencyCode
            (fromView as? ConverterViewWrapper)?.contentView.value = ((toView as? ConverterViewWrapper)?.contentView.currentValue.text)!
            if ((toView as? ConverterViewWrapper)?.contentView.currentValue.text)! == "0.0"{
                keyBoardTextField.text =  ""
            }else{
                keyBoardTextField.text = ((toView as? ConverterViewWrapper)?.contentView.currentValue.text)!
            }
            (fromView as? ConverterViewWrapper)?.contentView.flag = from.flag
        }
        if let to = toCountry{
            (toView as? ConverterViewWrapper)?.contentView.code = to.currencyCode
            (toView as? ConverterViewWrapper)?.contentView.value = fromValue!
            (toView as? ConverterViewWrapper)?.contentView.flag = to.flag
        }
        
    }
    
    func didCountrySelected(countryDetails: CountryVM) {
        
        if selectedView == 1{
            (fromView as? ConverterViewWrapper)?.contentView.configureDefaultView = countryDetails
            fromCountry = countryDetails
        }else{
            (toView as? ConverterViewWrapper)?.contentView.configureDefaultView = countryDetails
            toCountry = countryDetails
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countrySegue" {
            if let nextViewController = segue.destination as? CountriesVC {
                nextViewController.countryDelegate = self
            }
        }
    }
}
extension LosslessStringConvertible {
    var string: String { .init(self) }
}
