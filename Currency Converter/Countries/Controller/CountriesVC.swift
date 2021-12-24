//
//  CountriesVC.swift
//  Currency Converter
//
//  Created by Preeteesh Remalli on 23/12/21.
//

import UIKit

class CountriesVC: UIViewController {
    @IBOutlet weak var countriesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var countryDelegate : CountrySelectionProtocal?
    var countries : [CountryVM]?
    var filteredCountries : [CountryVM]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = false
        getCountriesList()
        
    }
    
    func getCountriesList(){
        
        let countryVM = CountriesViewModel()
        countryVM.getCountriesList { countries in
            self.countries = countries
            self.filteredCountries = countries
            DispatchQueue.main.async {
                self.countriesTableView.reloadData()
            }
        }
    }
}

extension CountriesVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        cell.configureCell(countryVM: filteredCountries![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        countryDelegate?.didCountrySelected(countryDetails: (filteredCountries![indexPath.row]))
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
}

extension CountriesVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredCountries = searchText.isEmpty ? countries : countries!.filter({ country in
            return country.name.range(of: searchText, options: .caseInsensitive) != nil
        })
        countriesTableView.reloadData()
    }
}
