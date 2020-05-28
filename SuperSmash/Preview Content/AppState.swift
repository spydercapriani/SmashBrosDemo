//
//  AppState.swift
//  SuperSmash
//
//  Created by Zack Shapiro on 5/27/20.
//  Copyright © 2020 Zack Shapiro. All rights reserved.
//

import SwiftUI

final class AppState: ObservableObject {

    @Published var characters: [SmashCharacter] = []
    @Published var selectedCharacter: SmashCharacter? = nil
    
    @Published var views: [ATView] = []
    
    // MARK: - Public Functions
    
    func parseViewsToComponents() -> [UIComponent] {
        views.sorted(by: { $0.position < $1.position }).map {
            switch $0.viewType {
            case .battleType:
                return BattleComponent(
                    uniqueId: $0.id,
                    text: $0.text
                )
            case .chooseCharacter:
                return ChooseCharacterComponent(
                    uniqueId: $0.id,
                    text: $0.text
                )
            }
        }
    }
    
}
