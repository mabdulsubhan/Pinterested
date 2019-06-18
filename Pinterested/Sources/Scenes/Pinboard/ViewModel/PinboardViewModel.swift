//
//  PinboardViewModel.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation

typealias PinboardViewModelOutput = (PinboardViewModel.Output) -> ()

/// PinboardViewModel Protocol
protocol PinboardViewModelProtocol {

    var dataProvider: PinboardDataProvider! { get }
    var coordinator: PinboardCoordinator! { get }
    var numberOfPins: Int { get }
    var output: PinboardViewModelOutput? { get set }
    func getPinboardCellViewModel(index : Int) -> PinboardTableCellViewModel
    func didSelectPin(index : Int)
    func didLoad()
    func tableViewDidReachToEnd()
    func didReset()
    func didSelectFiltering(with date: Date)
    func performCTA()
}

/// PinboardViewModel Implementation
final class PinboardViewModel: PinboardViewModelProtocol {
    
    /// View Output Bindings
    enum Output {
        case reloadPins
        case showActivityIndicator(show: Bool)
        case showDatePicker(show: Bool)
        case showFilterImage(show: Bool)
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
    var isFilteringActive: Bool = false {
        didSet {
            output?(.showFilterImage(show: isFilteringActive))
        }
    }
    private var allPinboardViewModels = [PinboardTableCellViewModel]() {
        didSet {
            output?(.reloadPins)
        }
    }
    private var filteredPinboardViewModels = [PinboardTableCellViewModel]()  {
        didSet {
            output?(.reloadPins)
        }
    }
    
    /// Computed Properties
    private var pinDataSourceViewModels: [PinboardTableCellViewModel] {
        if isFilteringActive {
            return filteredPinboardViewModels
        }
        return allPinboardViewModels
    }
    
    var numberOfPins: Int {
        return pinDataSourceViewModels.count
    }
   
    func didLoad() {
        getPins()
    }
    
    func tableViewDidReachToEnd() {
        getPins()
    }
    
    func didSelectFiltering(with date: Date) {
        activateFilter(with: date)
    }
    
    func performCTA() {
        (isFilteringActive) ?  clearFilter() : output?(.showDatePicker(show: true))
    }
    
    func didReset() {
        output?(.showDatePicker(show: false))
    }
    
    
    /// View Input Action Methods
    func getPinboardCellViewModel(index : Int) -> PinboardTableCellViewModel {
        return pinDataSourceViewModels[index]
    }
    
    func getPins() {
        if isFilteringActive == false  { dataProvider.providePins() }
    }
    
    /// Private Methods
    private func activateFilter(with date: Date) {
        isFilteringActive = true
        output?(.showDatePicker(show: false))
        let dateString = DateFormatter.shortFormatDateFormatter.string(from: date)
        filteredPinboardViewModels = allPinboardViewModels.filter({ ($0.pin?.identifier ?? "") == dateString })
    }

    private func clearFilter() {
        isFilteringActive = false
        filteredPinboardViewModels.removeAll()
    }
    
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
        //TODO
//        guard let results = pinsArray.results else { return }
//        allPinboardViewModels.append(contentsOf: results.map { PinboardTableCellViewModel.init($0) })
    }
    
    func onFailure(_ error: NetworkError) {
         output?(.showError(error: error))
    }
}

