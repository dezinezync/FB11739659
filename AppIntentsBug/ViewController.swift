//
//  ViewController.swift
//  AppIntentsBug
//
//  Created by Nikhil Nigade on 10/11/22.
//

import UIKit
import Combine

final class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  
  private var cancellables: [AnyCancellable] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    (UIApplication.shared.delegate as! AppDelegate).$focusItem.receive(on: DispatchQueue.main).sink { [weak self] focusItem in
      guard let self else {
        return
      }
      
      if let focusItem {
        self.label.text = "Active focus item: \(focusItem.title)"
      }
      else {
        self.label.text = "No Focus Item assigned"
      }
    }.store(in: &cancellables)
  }
  
  deinit {
    cancellables.forEach { $0.cancel() }
    cancellables.removeAll(keepingCapacity: false)
  }

}

