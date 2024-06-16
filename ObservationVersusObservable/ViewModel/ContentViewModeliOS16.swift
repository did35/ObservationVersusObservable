//
//  ContentViewModeliOS16.swift
//  ObservationVersusObservable
//
//  Created by Didier Delhaisse on 16/06/2024.
//

//

import Foundation

@Observable
class ContentViewModeliOS16ObservableMacro {
     var someText = "Hello from the ContentViewModel property, built for iOS16+ with @Observable macro."
}

// OR:

class ContentViewModeliOS16: ObservableObject {
    @Published var someText = "Hello from the ContentViewModel property, built for iOS16+ conforming to the ObservableObject protocol."
}
