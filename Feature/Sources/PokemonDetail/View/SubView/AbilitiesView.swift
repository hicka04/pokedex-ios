//
//  AbilitiesView.swift
//  Pokedex
//
//  Created by hicka04 on 2022/02/02.
//

import SwiftUI
import Entity
import Core
import DesignSystem

struct AbilitiesView: View {
    let abilities: Pokemon.Abilities

    var body: some View {
        VStack(alignment: .leading, spacing: .medium) {
            Text("Abilities")
                .font(.headline)

            VStack(alignment: .leading, spacing: .medium) {
                AbilityView(ability: abilities.first, isHidden: false)
                if let second = abilities.second {
                    AbilityView(ability: second, isHidden: false)
                }
                if let hidden = abilities.hidden {
                    AbilityView(ability: hidden, isHidden: true)
                }
            }.padding(.leading, .medium)
        }
    }
}

private extension AbilitiesView {
    struct AbilityView: View {
        let ability: Pokemon.Abilities.Ability
        let isHidden: Bool

        var body: some View {
            HStack(alignment: .lastTextBaseline) {
                Text(ability.name)
                if isHidden {
                    Text("(Hidden)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct AbilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        AbilitiesView(abilities: .bulbasaur)
            .previewLayout(.sizeThatFits)
    }
}
