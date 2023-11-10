//
//  GalleryView.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

import SwiftUI
import Kingfisher

struct GalleryView: View {

    let content: GalleryViewContent

    var body: some View {
        VStack(alignment: .leading) {
            Text(Localization.detail.photos)
                .font(.body.bold())
            ForEach(content.images) {
                KFImage($0.url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
            }
        }
    }
}

#Preview {
    GalleryView(content: .init(images: []))
}
