//
//  AddPlayerModal.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/2/21.
//

import SwiftUI


struct AddPlayerModal: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var game: Game
    
    @State private var name: String = ""
    @State private var icon: String = "Bmo";
    @State private var bgColor: Color = .primaryBlue;
    
    func onTap (id: Int) -> Void {
        icon = Icons.iconNames[id];
    }
    
    var body: some View {
        VStack {
            
            VStack {
                Text(name.count != 0 ? name : "New Player").font(.largeTitle).bold()
                PlayerIcon(imageName: icon, bgColor: bgColor).frame(width: 150, height: 150, alignment: .center)
            }.padding()
            
            Form {
                VStack(alignment: .leading, spacing: 30) {
                    
                    Section(header: Text("Name")) {
                        HStack {
                            Image(systemName: "person")
                            TextField("Patrick Star", text: $name)
                        }
                    }
                    
                    Section(header: Text("Icon")) {
                        IconPicker(onTap: onTap).frame(height: 150)
                    }
                    
                    ColorPicker("Icon Background", selection: $bgColor)
                   
                    
                }.padding()
            }
            
            HStack {
                Button("Create Player") {
                    let newPlayer = Player(name: name, color: bgColor, icon: icon, score: 0)
                    game.players.append(newPlayer)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(name.count == 0)
                .buttonStyle(ModalButtonStyle(disabled: name.count == 0))
                
            }.padding()
            
        }
        
    }
}

struct ModalButtonStyle: ButtonStyle {
    var disabled: Bool = false;
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(disabled ? Color.gray: Color.primaryGreen)
            .foregroundColor(.white)
            .font(.title)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        
    }
}

struct TestView: View {
    @State private var isPresented = false
    
    var body: some View {
        Button("Present!") {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented, content: AddPlayerModal.init)
    }
}

struct AddPlayerModal_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerModal()
    }
}
