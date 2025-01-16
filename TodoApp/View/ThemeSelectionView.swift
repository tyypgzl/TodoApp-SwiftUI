import SwiftUI

struct ThemeSelectionView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("selected_theme") private var selectedThemeType: ThemeType = .blue
    
    let themes: [(ThemeType, String)] = [
        (.light, "Light"),
        (.dark, "Dark"),
        (.blue, "Blue"),
        (.green, "Green"),
        (.gold, "Gold")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    ForEach(themes.indices, id: \.self) { index in
                        let (themeType, name) = themes[index]
                        let theme = Theme.from(themeType)
                        ThemeCard(
                            theme: theme,
                            name: name,
                            isSelected: themeType == selectedThemeType
                        )
                        .onTapGesture {
                            selectedThemeType = themeType
                            dismiss()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Select Theme")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: { dismiss() }) {
                        Text("Close")
                    }
                }
            }
        }
    }
}

struct ThemeCard: View {
    let theme: Theme
    let name: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 12)
                .fill(theme.backgorund)
                .frame(height: 100)
                .overlay(
                    VStack(spacing: 8) {
                        Circle()
                            .fill(theme.primary)
                            .frame(width: 30, height: 30)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(theme.fill)
                            .frame(height: 8)
                    }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(theme.primary, lineWidth: isSelected ? 2 : 0)
                )
            
            Text(name)
                .font(.subheadline)
                .foregroundColor(theme.onBackground)
        }
    }
}

#Preview {
    ThemeSelectionView()
} 