//
//  SettingsView.swift
//  Fructus
//
//  Created by Vladimir Sukanica on 5.2.21..
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 20){
                    //MARK: - SECTION 1
                    
                    GroupBox(label:
                    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    
                    ) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium, and claories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins , and more.")
                                .font(.footnote)
                        })
                    }
                    
                    //MARK: - SECTION 2
                    
                    GroupBox(
                        label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush"), content: {
                            Divider().padding(.vertical, 4)
                            
                            Text("If you wish, you can restart the application by toogle the switch in this box. That way it starts the onboarding process and you will se the welcome screen again.")
                                .padding(.vertical, 8)
                                .frame(minHeight: 60)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                            
                            Toggle(isOn: $isOnboarding){
                                if isOnboarding {
                                    Text("Restarted".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                } else {
                                    Text("Restart".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.secondary)
                                }
                            }
                            .padding()
                            .background(
                                Color(UIColor.tertiarySystemBackground)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                        })
                    
                    //MARK: - SECTION 3
                    
                    GroupBox(
                        label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                            .padding(.vertical, 4), content: {
                            SettingsRowView(name: "Developer", content: "Vladimir Sukanica")
                            SettingsRowView(name: "Designer", content: "Robert Petras")
                            SettingsRowView(name: "Compatibility", content: "iOS 14")
                            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                            SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                            SettingsRowView(name: "SwiftUI", content: "2.0")
                            SettingsRowView(name: "Version", content: "1.1.0")
                        }
                    )
                    
                }
            })
            .navigationBarTitle(Text("Settings"), displayMode: .large)
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
               Image(systemName: "xmark")
            }))
            .padding()

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
