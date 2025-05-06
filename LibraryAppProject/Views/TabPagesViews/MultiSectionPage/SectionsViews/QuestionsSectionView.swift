// Preparation of a questions section for further development
// Not called on project build

import SwiftUI

// MARK: - Popular Questions Section View

struct QuestionsSectionView: View {
    
    // MARK: - Body
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    DetailViewExpandableDescription(title: "title 1", description: "Some Description", customColor: customColor, customFont: customFont)
                }
            }
        }
    }
}
