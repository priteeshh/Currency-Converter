//
//  CoverterVM.swift
//  Currency Converter
//
//  Created by Preeteesh Remalli on 24/12/21.
//

import Foundation
class ConverterViewModel{
    
    func convert(_ from: String, _ to: String, _ value: String, completion : @escaping (CurrencyResultVM) -> ()){
        let resource = Resource<CurrencyResult>(url: URL(string: "https://api.fastforex.io/convert?from=\(from)&to=\(to)&amount=\(value)&api_key=0d3e4675f1-8ca72dca9d-r4kcg3")!)
        WebService().load(resource: resource) { result in
            switch result{
            case .success(let res):
                completion(CurrencyResultVM(currencyResult: res, key: to))
            case .failure(let error):
                switch error{
                case .decodingError:
                    Utlitity.shared.showAlert(error: "Error with Data please try later")
                case .urlError:
                    Utlitity.shared.showAlert(error: "Something went wrong, please try later")
                case .domainError:
                    Utlitity.shared.showAlert(error: "Network error, please try later")
                }
            }
        }
    }
}
class CurrencyResultVM{
    var value: String
    
    init(currencyResult : CurrencyResult, key: String){
        self.value = currencyResult.result?[key]?.string ?? "0.0"
    }
}

