//
//  CountriesVM.swift
//  Currency Converter
//
//  Created by Preeteesh Remalli on 24/12/21.
//

import Foundation
class CountriesViewModel{
    
    func getCountriesList(completion : @escaping ([CountryVM]) -> ()){
        let resource = Resource<Countries>(url: Bundle.main.url(forResource: "countries", withExtension: "json")!)
        WebService().load(resource: resource) { result in
            switch result{
            case .success(let countries):
                completion(CountriesArrayViewModel(allCountries: countries).countryArray)
            case .failure(let error):
                print(error)
            }
        }
    }
}
class CountriesArrayViewModel{
    var countryArray = [CountryVM]()
        init(allCountries : Countries){
            for country in allCountries{
                self.countryArray.append(CountryVM(data: country))
            }
    }
}
class CountryVM{
    
    var name : String
    var currencyCode : String
    var currencyName : String
    var flag : Data
    
    init(data : Country){
        self.name = data.name
        self.currencyCode = data.currency.code
        self.currencyName = data.currency.name
        let dataDecoded : Data = Data(base64Encoded: data.flag, options: .ignoreUnknownCharacters)!
        self.flag = dataDecoded
    }
    
}

