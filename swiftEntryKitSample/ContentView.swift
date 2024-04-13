//
//  ContentView.swift
//  swiftEntryKitSample
//
//  Created by kenty on 2024/04/13.
//

import SwiftUI
import SwiftEntryKit

struct ContentView: View {
    
    // default値
    static let defaultFontSize: Int = 17;
    static let defaultFontColor: EKColorPreset = ekColorPreset.first!
    static let defaultFontWeight: UIFont.Weight = .medium
    static let defaultImageSize: Int = 40;

    // 基本設定
    @State var inputTitle = "Title"
    @State var inputMessage = "Message"
    @State var isImage = true
    
    // 詳細設定
    @State var selectionEKAttributePreset: EKAttributePreset = ekAttributesPresets.first!
    @State var selectionTitleFontSize: Int = defaultFontSize
    @State var selectionTitleFontColor: EKColorPreset = defaultFontColor
    @State var selectionTitleFontWeight: UIFont.Weight = defaultFontWeight
    @State var selectionMessageFontSize: Int = defaultFontSize
    @State var selectionMessageFontColor: EKColorPreset = defaultFontColor
    @State var selectionMessageFontWeight: UIFont.Weight = defaultFontWeight
    @State var inputImageWidth: Int = defaultImageSize
    @State var inputImageHeight: Int = defaultImageSize
    @State var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            List {
                Section(content: {
                    TextField("Title", text: $inputTitle)
                    TextField("Message", text: $inputMessage)
                    Toggle(isOn: $isImage, label: {
                        Text("Image")
                    })
                    Picker("Attribute Preset", selection: $selectionEKAttributePreset) {
                        ForEach(ekAttributesPresets, id: \.self) { attribute in
                            Text(attribute.name).tag(attribute)
                        }
                    }
                }, header: {
                    Text("基本設定")
                })
                Section(isExpanded: $isExpanded, content: {
                    GroupBox("Title") {
                        HStack(content: {
                            Text("text:")
                            TextField("Title", text: $inputTitle)
                            Spacer()
                        })
                        HStack(content: {
                            Text("size:")
                            TextField("", value: $selectionTitleFontSize, format: .number)
                            Spacer()
                        })
                        HStack(content: {
                            Text("color:")
                            Rectangle()
                                .fill(Color(uiColor: $selectionTitleFontColor.uiColor.wrappedValue))
                                   .frame(width: 17, height: 17, alignment: .center)
                            Picker("color", selection: $selectionTitleFontColor) {
                                ForEach(ekColorPreset, id: \.self) { color in
                                    Text(color.name).tag(color)
                                }
                            }
                            Spacer()
                        })
                        HStack(content: {
                            Text("weight:")
                            Picker("weight", selection: $selectionTitleFontWeight) {
                                ForEach(uiFontPreset, id: \.self) { weight in
                                    Text("\(weight.rawValue)").tag(weight)
                                }
                            }
                            Spacer()
                        })
                    }
                    GroupBox("Message") {
                        HStack(content: {
                            Text("text:")
                            TextField("Message", text: $inputMessage)
                            Spacer()
                        })
                        HStack(content: {
                            Text("size:")
                            TextField("", value: $selectionMessageFontSize, format: .number)
                            Spacer()
                        })
                        HStack(content: {
                            Text("color:")
                            Rectangle()
                                .fill(Color(uiColor: $selectionMessageFontColor.uiColor.wrappedValue))
                                   .frame(width: 17, height: 17, alignment: .center)
                            Picker("color", selection: $selectionMessageFontColor) {
                                ForEach(ekColorPreset, id: \.self) { color in
                                    Text(color.name).tag(color)
                                }
                            }
                            Spacer()
                        })
                        HStack(content: {
                            Text("weight:")
                            Picker("weight", selection: $selectionMessageFontWeight) {
                                ForEach(uiFontPreset, id: \.self) { weight in
                                    Text("\(weight.rawValue)").tag(weight)
                                }
                            }
                            Spacer()
                        })
                    }
                    GroupBox("Image") {
                        Toggle(isOn: $isImage, label: {
                            Text("available:")
                        })
                        HStack(content: {
                            Text("width:")
                            TextField("", value: $inputImageWidth, format: .number)
                            Spacer()
                        })
                        HStack(content: {
                            Text("height:")
                            TextField("", value: $inputImageHeight, format: .number)
                            Spacer()
                        })
                        Image(uiImage: UIImage(named: "sample.png")!)
                    }
                  
                }, header: {
                    Text("詳細設定")
                })
                Section(content: {
                    Button(action: {
                        reset()
                    }, label: {
                        Text("リセット")
                    })
                   
                }, header: {
                    Text("その他")
                })
            }
            .listStyle(.sidebar)
        }
        Button("Display Entry"){
            let attributes = getAttributes()
            let contentView = getContentView()
            SwiftEntryKit.display(entry: contentView, using: attributes)
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    private func getAttributes() -> EKAttributes {
        var attributes = $selectionEKAttributePreset.attributes.wrappedValue
        
        attributes.entryBackground = .gradient(
            gradient: .init(colors: [EKColor(.red), EKColor(.green)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1))
        )
        attributes.popBehavior = .animated(
            animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7))
        )
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
        attributes.statusBar = .dark
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        let minEdge = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        attributes.positionConstraints.maxSize = .init(width: .constant(value: minEdge), height: .intrinsic)
        
        return attributes
    }
    
    private func getContentView() -> EKNotificationMessageView {
        let title = EKProperty.LabelContent(
            text: inputTitle,
            style: .init(
                font: UIFont.systemFont(
                    ofSize: CGFloat(selectionTitleFontSize),
                    weight: selectionTitleFontWeight
                ),
                color: selectionTitleFontColor.color)
            )
        let description = EKProperty.LabelContent(
            text: inputMessage,
            style: .init(
                font: UIFont.systemFont(
                    ofSize: CGFloat(selectionMessageFontSize),
                    weight: selectionMessageFontWeight
                ),
                color: selectionMessageFontColor.color)
            )
        let image = EKProperty.ImageContent(
            image: UIImage(named: "sample.png")!,
            size: CGSize(width: inputImageWidth, height: inputImageHeight)
        )
        return EKNotificationMessageView(with: EKNotificationMessage(simpleMessage: EKSimpleMessage(
            image: isImage ? image : nil,
            title: title,
            description: description
        )))
    }
    
    private func reset() -> Void {
        // 基本設定
        inputTitle = "Title"
        inputMessage = "Message"
        isImage = false
        // 詳細設定
        self.selectionEKAttributePreset = ekAttributesPresets.first!
        selectionTitleFontSize = ContentView.defaultFontSize
        selectionTitleFontColor = ContentView.defaultFontColor
        selectionTitleFontWeight = ContentView.defaultFontWeight
        selectionMessageFontSize = ContentView.defaultFontSize
        selectionMessageFontColor = ContentView.defaultFontColor
        selectionMessageFontWeight = ContentView.defaultFontWeight
        inputImageWidth = ContentView.defaultImageSize
        inputImageHeight = ContentView.defaultImageSize
        isExpanded = false
    }
}


#Preview {
    ContentView()
}
