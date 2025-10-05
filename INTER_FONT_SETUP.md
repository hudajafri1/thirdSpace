# Inter Font Setup for iOS

## Option 1: Using Inter as System Font (Recommended)

If Inter is available on the system, you can use it directly. However, for guaranteed availability, you should add the font files to your project.

## Option 2: Adding Inter Font Files to Project

### Step 1: Download Inter Font
1. Go to [Inter Font GitHub](https://github.com/rsms/inter/releases)
2. Download the latest release
3. Extract the ZIP file
4. Navigate to `fonts/ttf/` folder

### Step 2: Add Font Files to Xcode Project
1. Open your project in Xcode
2. Right-click on your project in the navigator
3. Select "Add Files to [ProjectName]"
4. Navigate to the `fonts/ttf/` folder
5. Select these font files:
   - `Inter-Regular.ttf`
   - `Inter-Medium.ttf`
   - `Inter-SemiBold.ttf`
   - `Inter-Bold.ttf`
6. Make sure "Add to target" is checked for your main app target
7. Click "Add"

### Step 3: Add Font to Info.plist
1. In Xcode, find your `Info.plist` file
2. Right-click and select "Open As" → "Source Code"
3. Add this before the closing `</dict>` tag:

```xml
<key>UIAppFonts</key>
<array>
    <string>Inter-Regular.ttf</string>
    <string>Inter-Medium.ttf</string>
    <string>Inter-SemiBold.ttf</string>
    <string>Inter-Bold.ttf</string>
</array>
```

### Step 4: Verify Font Names
The font names in code should be:
- Regular: "Inter"
- Medium: "Inter-Medium"
- SemiBold: "Inter-SemiBold"
- Bold: "Inter-Bold"

## Current Implementation

Your ContentView has been updated to use Inter font:

- **Header Title**: Inter Bold, 20pt
- **Footer Labels**: Inter Regular, 10pt

## Font Usage Examples

```swift
// Regular
.font(.custom("Inter", size: 16))

// Medium
.font(.custom("Inter-Medium", size: 16))

// SemiBold
.font(.custom("Inter-SemiBold", size: 16))

// Bold
.font(.custom("Inter-Bold", size: 16))
```

## Troubleshooting

If fonts don't appear:
1. Check that font files are added to the target
2. Verify Info.plist entries
3. Clean and rebuild the project
4. Check font names match exactly (case-sensitive)

## Alternative: Using SF Pro with Inter-like Styling

If you prefer not to add custom fonts, you can use SF Pro with similar characteristics:

```swift
.font(.system(size: 16, weight: .regular, design: .default))
.font(.system(size: 16, weight: .medium, design: .default))
.font(.system(size: 16, weight: .semibold, design: .default))
.font(.system(size: 16, weight: .bold, design: .default))
```
