import SwiftUI

struct AppIconGenerator: View {
    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.25, blue: 0.35)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("notes")
                    .font(.system(size: 140, weight: .bold))
                    .tracking(8)
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Circle()
                .stroke(Color(red: 0.2, green: 0.8, blue: 0.8), lineWidth: 35)
                .frame(width: 240, height: 240)
                .offset(x: -80, y: 0)
        }
        .frame(width: 1024, height: 1024)
        .clipShape(RoundedRectangle(cornerRadius: 226))
    }
}

#Preview {
    AppIconGenerator()
        .frame(width: 512, height: 512)
}
