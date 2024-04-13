//
//  ContentView.swift
//  swiftEntryKitSample
//
//  Created by kenty on 2024/04/13.
//

import SwiftUI
import SwiftEntryKit

struct ContentView: View {
    
//    private func getBottomAlertAttributes() -> EKAttributes{
//        var attributes = EKAttributes.bottomFloat
//        attributes.hapticFeedbackType = .success
//        attributes.displayDuration = .infinity
//        attributes.entryBackground = .color(color: .white)
//        attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 8))
//        attributes.screenInteraction = .dismiss
//        attributes.entryInteraction = .absorbTouches
//        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
//        attributes.roundCorners = .all(radius: 25)
//        attributes.entranceAnimation = .init(translate: .init(duration: 0.7, spring: .init(damping: 1, initialVelocity: 0)),
//                                             scale: .init(from: 1.05, to: 1, duration: 0.4, spring: .init(damping: 1, initialVelocity: 0)))
//        attributes.exitAnimation = .init(translate: .init(duration: 0.2))
//        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.2)))
//        attributes.positionConstraints.verticalOffset = 10
//        attributes.positionConstraints.size = .init(width: .offset(value: 20), height: .intrinsic)
//        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .intrinsic)
//        attributes.statusBar = .dark
//        return attributes
//    }
    
    private var items = [
        ButtonItem(title: "1", action: {
            print("hod")
        }),
        ButtonItem(title: "2", action: {
            // Generate top floating entry and set some properties
            var attributes = EKAttributes.topFloat
            attributes.entryBackground = .gradient(gradient: .init(colors: [EKColor(.red), EKColor(.green)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
            attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
            attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
            attributes.statusBar = .dark
            attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
            let minEdge = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
            attributes.positionConstraints.maxSize = .init(width: .constant(value: minEdge), height: .intrinsic)
            
            let titleText = "hoge"
            let titleFont =  UIFont.systemFont(ofSize: 17, weight: .medium)
            //            let titleFont =  UIFont(name: "Barlow-Regular", size: 17)!
            let textColor =  EKColor.black
            let title = EKProperty.LabelContent(text: titleText, style: .init(font: titleFont, color: textColor))
            
            let descText = titleText
            let descFont =  titleFont
            let description = EKProperty.LabelContent(text: descText, style: .init(font: descFont, color: textColor))
            
            let imageName = "sample.png"
            
            let image = EKProperty.ImageContent(image: UIImage(named: imageName)!, size: CGSize(width: 35, height: 35))
            let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
            let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)

            let contentView = EKNotificationMessageView(with: notificationMessage)
            SwiftEntryKit.display(entry: contentView, using: attributes)

        }),
    ]
    var body: some View {
        
        VStack {
            ForEach(items, id: \.self.title) { item in
                Button(item.title){
                    item.action()
                }
                    .buttonStyle(.borderedProminent)
            }
        }
    }
    
    

}

#Preview {
    ContentView()
}
