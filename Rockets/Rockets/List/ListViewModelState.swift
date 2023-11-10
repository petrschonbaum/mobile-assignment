//
//  ListViewModelState.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

enum ListViewModelState {
    case loading
    case loaded([RocketListViewContent])
    case error
}
