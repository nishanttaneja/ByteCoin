#  ByteCoin
An iOS Application which fetches the latest Bitcoin exchange rate for user selected currency.
<b> NOTE : Update your [API Key](#CoinAPI) in PrivateData (path: Models/PrivateData.swift) </b> 

## Screenshot
<img src="HomeScreen.png" width="250">

## Technologies
### Apple
- <a href="https://developer.apple.com/documentation/uikit"> UIKit </a> - Construct and manage a graphical, event-driven user interface for your iOS or tvOS app.
    - <a href="https://developer.apple.com/documentation/uikit/uipickerview"> UIPickerView </a> - A view that uses a spinning-wheel or slot-machine metaphor to show one or more sets of values.
        - <a href="https://developer.apple.com/documentation/uikit/uipickerviewdatasource"> UIPickerViewDataSource </a> - The UIPickerViewDataSource protocol must be adopted by an object that mediates between a UIPickerView object and your application’s data model for that picker view. The data source provides the picker view with the number of components, and the number of rows in each component, for displaying the picker view data. Both methods in this protocol are required.
        - <a href="https://developer.apple.com/documentation/uikit/uipickerviewdelegate"> UIPickerViewDelegate </a> - The delegate of a UIPickerView object must adopt this protocol and implement at least some of its methods to provide the picker view with the data it needs to construct itself.
### Custom
- CoinManager - Deals with networking operations for fetching latest exchange rates of Bitcoin for specified currency.
- CoinManagerDelegate - The delegate of a CoinManager object must adopt this protocol and implement its methods to implement the fetched data.
- ParsedData - Decodable Structure for parsing exchange rate from session data of API request.
        
### CoinAPI
- <a href="https://www.coinapi.io/pricing?apikey"> Get a free API key</a>
- <a href="https://docs.coinapi.io/#get-specific-rate"> Get specific Bitcoin exchange rate </a> - https://rest.coinapi.io/v1/exchangerate/BTC/{specific_currency}?apikey={your_api_key}

## Credits
- <a href="https://developer.apple.com/documentation"> Apple Developer Documentation </a>
- <a href="https://www.udemy.com/course/ios-13-app-development-bootcamp/"> iOS Application Development Bootcamp </a> by Dr. Angela Yu.
- <a href="https://docs.coinapi.io"> CoinAPI </a> - CoinAPI is a platform which provides fast, reliable and unified data APIs to cryptocurrency markets.
