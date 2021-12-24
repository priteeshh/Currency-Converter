
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
/Users/preeteeshremalli/Documents/iOS Projects/Currency Converter/Currency Converter/Resources/Screen Recording 2021-12-24 at 2.28.18 PM.gif




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


## Documentation

