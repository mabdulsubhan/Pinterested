//
//  PinDetailViewModel.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 18/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import UIKit

typealias PinDetailModelOutput = (PinDetailViewModel.Output) -> ()

/// PinDetailViewModel Protocol
protocol PinDetailViewModelProtocol {
    var output: PinDetailModelOutput? { get set }
    func viewDidLoad()
}

/// PinDetailViewModel Implementation
final class PinDetailViewModel: PinDetailViewModelProtocol {

    /// View Output Bindings
    enum Output {
        case showPinImageView(url: URL)
    }
    
    /// Stored Properties
    var output: PinDetailModelOutput?
    private var pin: Pin?
    
    
    /// Computed Properties
    var imageURL: URL? {
        if let pin = pin {
            return URL(string: pin.urls.raw + "?w=1200")
        }
        return nil
    }
  
    var pinIdentifier: String {
        return pin?.identifier ?? ""
    }
    
    func viewDidLoad() {
        showPinImage()
    }
    
    /// Init
    init(_ pin: Pin?) {
        self.pin = pin
    }
    
    /// Private Method
    private func showPinImage() {
        
        guard let imageURL = imageURL else { return }
        output?(.showPinImageView(url: imageURL))
    }
}
