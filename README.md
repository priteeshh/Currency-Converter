
# Currency Converter

This project is a simple currency converter app for iOS

## Swift

This project is written in Swift 5
## API Reference

This project makes use of the fastforex API to get currency exchange rates. 

url : https://api.fastforex.io/convert?from=<from_Currency>&to=<to_Currency>&amount=<value>&api_key=<api_Key>

Sample Request :

    from_currency : String = "USD"
    to_Currency : String = "INR"
    value : String = 

Response:

    {
        "base": "USD",
        "amount": 1,
        "result": {
            "INR": 75.08,
            "rate": 75.0757
        },
        "ms": 5
    }
## Demo

![Alt text](https://github.com/priteeshh/Currency-Converter/blob/main/Currency%20Converter/Resources/demo.gif)



## Features

Design Pattern followed : MVVM

To make controller lightweight followed MVVM pattern.
API call is handled by View Model and Modified response id passed to Controller to display.

Screens: 

Converter Screen:

Have two sections to convert currency
    1. From currency
    2. To currency

These sessions are designed from reusable UIView.

On lanch of app will navigate to Converter screen and keyboard is enabled.
To select the from/to currency tap on the section and will navigate to Country Screen.

Country Screen:

In this Screen can select the country/currency to convert.
There is search bar to search currency by country name.


---> Dark Mode Supported


## Documentation

WebService: This is generic API class using NSURL session
countries.json : List of all countries and currencies details to populate in contries      ViewController
Converter : 
    Model: Currency model (API response converted values)
    View: Reusable view to display two sections(from currency and to currency)
    View Modal : API call to convert the currency and modified Viewmodel to send to controller
    Controller: Displays the From/To views and option to swap the conversion.
    
Countries:
    Model: Countries model
    View: Tableview cell
    ViewModel: Function to get all countries details and send the modified Viewmodel to Controllel
    Countroller : Displays contries details on table view and ooption to search.

## Future Improvements 

To support multi currency conversion support.
