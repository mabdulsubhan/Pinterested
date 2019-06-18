//
//  PinboardViewModel.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

typealias PinboardViewModelOutput = (PinboardViewModel.Output) -> ()

/// PinboardViewModel Protocol
protocol PinboardViewModelProtocol {

    var dataProvider: PinboardDataProvider! { get }
    var coordinator: PinboardCoordinator! { get }
    var numberOfPins: Int { get }
    var output: PinboardViewModelOutput? { get set }
    func getPinboardCellViewModel(index : Int) -> PinboardTableCellViewModel
    func getHeightOfPin(atIndex index: Int) -> CGFloat
    func didSelectPin(index : Int)
    func didLoad()
    func reload()
}

/// PinboardViewModel Implementation
final class PinboardViewModel: PinboardViewModelProtocol {
    
    /// View Output Bindings
    enum Output {
        case reloadPins
        case showActivityIndicator(show: Bool)
        case showError(error: Error)
    }
    
    /// Injected Properties
    var dataProvider: PinboardDataProvider!
    var coordinator: PinboardCoordinator!
    
    /// Injected Properties Initlizaer
    init(withDataProvider pinboardDataProvider: PinboardDataProvider,
         andCoordinator pinboardCoordinator: PinboardCoordinator) {
        self.dataProvider = pinboardDataProvider
        self.coordinator = pinboardCoordinator
    }
    
    /// Stored Properties
    var output: PinboardViewModelOutput?
    
    /// Observables Properties
    private var allPinboardViewModels = [PinboardTableCellViewModel]() {
        didSet {
            output?(.reloadPins)
        }
    }
    
    /// Computed Properties
    private var pinDataSourceViewModels: [PinboardTableCellViewModel] {
        return allPinboardViewModels
    }
    
    var numberOfPins: Int {
        return pinDataSourceViewModels.count
    }
   
    func didLoad() {
        getPins()
    }
    
    func reload() {
        getPins()
    }
    
    /// View Input Action Methods
    func getPinboardCellViewModel(index : Int) -> PinboardTableCellViewModel {
        return pinDataSourceViewModels[index]
    }
    
    func getHeightOfPin(atIndex index: Int) -> CGFloat {
        let originalHeight = CGFloat(getPinboardCellViewModel(index: index).imageHeight)
        let originalWidth = CGFloat(getPinboardCellViewModel(index: index).imageWidth)
        let ratio = originalHeight/originalWidth
        let newWidth = UIScreen.main.bounds.maxX/2
        let newHeight = newWidth * ratio
        return newHeight * 2.5
    }
    
    func getPins() {
        dataProvider.providePins()
    }
    
    /// Private Methods
    func didSelectPin(index: Int) {
        coordinator.navigateToPinDetail(withPin: getPinboardCellViewModel(index: index).pin)
    }
}


/// PinboardDataProviderDelegate Delegate
extension PinboardViewModel: PinboardDataProviderDelegate {
    
    func showLoader(show: Bool) {
        output?(.showActivityIndicator(show: show))
    }
    
    func onSuccess(_ pinsArray: [Pin]) {
        allPinboardViewModels.append(contentsOf: pinsArray.map { PinboardTableCellViewModel.init($0) })
    }
    
    func onFailure(_ error: NetworkError) {
         output?(.showError(error: error))
    }
}

