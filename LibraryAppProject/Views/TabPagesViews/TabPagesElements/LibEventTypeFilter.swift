import SwiftUI

// MARK: Events Page Filter By Type Element

struct LibEventTypeFilter: View {
    
    // MARK: - Input Properties
    
    let types: [String]
    let selectedType: String?
    let onSelectType: (String?) -> Void
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(types, id: \.self) { type in
                    Button(action: {
                        onSelectType(selectedType == type ? nil : type)
                    }) {
                        Text(type)
                            .padding()
                            .bold()
                            .background(selectedType == type ? customColor : customColor2)
                            .foregroundColor(selectedType == type ? .white : .black)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}
