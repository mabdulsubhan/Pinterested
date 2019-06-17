//
//  DatePicketView.swift
//  Pinterested
//
//  Created by Muhammad Abdul Subhan on 17/06/2019.
//  Copyright © 2019 Subhan. All rights reserved.
//

import Foundation
import UIKit

protocol DatePickerViewDelegate: class {
    func datePickerDidCancel(_ sender: DatePickerView)
    func datePicker(_ sender: DatePickerView, didSelect date: Date)
}

class DatePickerView: UIView {
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var datePicker: UIDatePicker!
    weak var delegate: DatePickerViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        datePicker.setValue(UIColor.white, forKey: "textColor")
        datePicker.backgroundColor = UIColor.black
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.datePicker(self, didSelect: datePicker.date)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        delegate?.datePickerDidCancel(self)
    }
}
