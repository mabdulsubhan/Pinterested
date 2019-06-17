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
    var numberOfMovies: Int { get }
    var output: PinboardViewModelOutput? { get set }
    func getPinboardCellViewModel(index : Int) -> PinboardTableCellViewModel
    func didSelectPin(index : Int)
    func didLoad()
    func tableViewDidReachToEnd()
    func didReset()
    func didSelectFiltering(with date: Date)
    func performCTA()
}

/// MovieListViewModel Implementation
final class PinboardViewModel: PinboardViewModelProtocol {
    
    /// View Output Bindings
    enum Output {
        case reloadMovies
        case showActivityIndicator(show: Bool)
        case showDatePicker(show: Bool)
        case showFilterImage(show: Bool)
        case showError(error: Error)
    }
    
    /// Injected Properties
    var dataProvider: PinboardDataProvider!
    var coordinator: PinboardCoordinator!
    
    /// Injected Properties Initlizaer
    init(withDataProvider movieListDataProvider: PinboardDataProvider,
         andCoordinator movieListCoordinator: PinboardCoordinator) {
        self.dataProvider = movieListDataProvider
        self.coordinator = movieListCoordinator
    }
    
    /// Stored Properties
    var output: PinboardViewModelOutput?
    
    /// Observables Properties
    var isFilteringActive: Bool = false {
        didSet {
            output?(.showFilterImage(show: isFilteringActive))
        }
    }
    private var allMovieListViewModels = [PinboardTableCellViewModel]() {
        didSet {
            output?(.reloadMovies)
        }
    }
    private var filteredMovieListViewModels = [PinboardTableCellViewModel]()  {
        didSet {
            output?(.reloadMovies)
        }
    }
    
    /// Computed Properties
    private var movieDataSourceViewModels: [PinboardTableCellViewModel] {
        if isFilteringActive {
            return filteredMovieListViewModels
        }
        return allMovieListViewModels
    }
    
    var numberOfMovies: Int {
        return movieDataSourceViewModels.count
    }
   
    func didLoad() {
        getUpcomingMovies()
    }
    
    func tableViewDidReachToEnd() {
        getUpcomingMovies()
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
        return movieDataSourceViewModels[index]
    }
    
    func getUpcomingMovies() {
        if isFilteringActive == false  { dataProvider.providePaginatedUpcomingMovies() }
    }
    
    /// Private Methods
    private func activateFilter(with date: Date) {
        isFilteringActive = true
        output?(.showDatePicker(show: false))
        let dateString = DateFormatter.shortFormatDateFormatter.string(from: date)
        filteredMovieListViewModels = allMovieListViewModels.filter({ ($0.movie?.releaseDate ?? "") == dateString })
    }

    private func clearFilter() {
        isFilteringActive = false
        filteredMovieListViewModels.removeAll()
    }
    
    func didSelectPin(index: Int) {
        coordinator.navigateToMovieDetail(withMovie: getPinboardCellViewModel(index: index).movie)
    }
}


/// PinboardDataProviderDelegate Delegate
extension PinboardViewModel: PinboardDataProviderDelegate {
    
    func showLoader(show: Bool) {
        output?(.showActivityIndicator(show: show))
    }
    
    func onSuccess(_ upcomingMovies: UpcomingMovies) {
        guard let results = upcomingMovies.results else { return }
        allMovieListViewModels.append(contentsOf: results.map { PinboardTableCellViewModel.init($0) })
    }
    
    func onFailure(_ error: NetworkError) {
         output?(.showError(error: error))
    }
}

