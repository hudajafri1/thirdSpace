
import SwiftUI
import GoogleMaps
import UIKit

@main
struct thirdSpaceApp: App {
    init() {
        registerInterFonts()
        
        let apiKey = "AIzaSyAABlvUhPzcXJHCJWjBg4fqc7ytDW6kxPA"
        
        if !apiKey.isEmpty && apiKey != "YOUR_GOOGLE_MAPS_API_KEY_HERE" {
            do {
                try GMSServices.provideAPIKey(apiKey)
            } catch {
            }
        } else {
        }
    }
    
    private func registerInterFonts() {
        if let variableFontURL = Bundle.main.url(forResource: "Inter-VariableFont_opsz,wght", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(variableFontURL as CFURL, .process, nil)
        }
        
        if let italicVariableFontURL = Bundle.main.url(forResource: "Inter-Italic-VariableFont_opsz,wght", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(italicVariableFontURL as CFURL, .process, nil)
        }
        
        let staticFonts = [
            "Inter_18pt-Regular", "Inter_18pt-Bold", "Inter_18pt-Medium", "Inter_18pt-SemiBold",
            "Inter_24pt-Regular", "Inter_24pt-Bold", "Inter_24pt-Medium", "Inter_24pt-SemiBold",
            "Inter_28pt-Regular", "Inter_28pt-Bold", "Inter_28pt-Medium", "Inter_28pt-SemiBold"
        ]
        
        for fontName in staticFonts {
            if let fontURL = Bundle.main.url(forResource: fontName, withExtension: "ttf") {
                CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, nil)
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
