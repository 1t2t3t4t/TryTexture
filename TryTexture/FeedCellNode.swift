//
//  ASCellNode.swift
//  TryTexture
//
//  Created by Thanapat Sorralump on 21/12/2561 BE.
//  Copyright © 2561 Thanapat Sorralump. All rights reserved.
//

import AsyncDisplayKit

class FeedCellNode: ASCellNode {
    
    private let userNameNode = ASTextNode()
    private let imageNode = ASNetworkImageNode()
    
    func configure(row: Int, feed: FeedModel) {
        backgroundColor = feed.backgroundColor
        setupTextNode(row: row, text: feed.text)
        setupImageNode(url: feed.image)
    }

    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let headerStackSpec = ASStackLayoutSpec(direction: .vertical,
                                                spacing: 20,
                                                justifyContent: .start,
                                                alignItems: .center,
                                                children: [userNameNode, imageNode])
        
        imageNode.style.preferredSize = CGSize(width: 80, height: 80)

        return headerStackSpec
    }
    
    private func setupTextNode(row: Int, text: String) {
        let attrs = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 20.0)]
        let textToShow = "\(row) - " + text
        userNameNode.attributedText = NSAttributedString(string: textToShow, attributes: attrs as [NSAttributedString.Key : Any])
        userNameNode.maximumNumberOfLines = 0
        userNameNode.truncationMode = .byTruncatingTail
    }
    
    private func setupImageNode(url: URL?) {
        imageNode.url = url
    }
}
