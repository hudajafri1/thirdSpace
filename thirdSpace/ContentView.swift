
import SwiftUI
import GoogleMaps

struct Stroke1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = Double(22)
        let height = Double(22)
        path.move(to: CGPoint(x: 0.5*width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.4285714286*height))
        path.addLine(to: CGPoint(x: 0, y: 0.9285714286*height))
        path.addCurve(to: CGPoint(x: 0.0714285714*width, y: height), control1: CGPoint(x: 0, y: 0.968020337*height), control2: CGPoint(x: 0.031979663*width, y: height))
        path.addLine(to: CGPoint(x: 0.3571428571*width, y: height))
        path.addLine(to: CGPoint(x: 0.3571428571*width, y: 0.7857142857*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.6428571429*height), control1: CGPoint(x: 0.3571428571*width, y: 0.7068164689*height), control2: CGPoint(x: 0.4211021832*width, y: 0.6428571429*height))
        path.addCurve(to: CGPoint(x: 0.6428571429*width, y: 0.7857142857*height), control1: CGPoint(x: 0.5788978168*width, y: 0.6428571429*height), control2: CGPoint(x: 0.6428571429*width, y: 0.7068164689*height))
        path.addLine(to: CGPoint(x: 0.6428571429*width, y: height))
        path.addLine(to: CGPoint(x: 0.9285714286*width, y: height))
        path.addCurve(to: CGPoint(x: width, y: 0.9285714286*height), control1: CGPoint(x: 0.968020337*width, y: height), control2: CGPoint(x: width, y: 0.968020337*height))
        path.addLine(to: CGPoint(x: width, y: 0.4285714286*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0))
        path.closeSubpath()
        return path
    }
}

struct Vector: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = Double(22)
        let height = Double(20)
        path.move(to: CGPoint(x: 0, y: 0.2*height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0.3181818182*width, y: 0.8*height))
        path.addLine(to: CGPoint(x: 0.6818181818*width, y: height))
        path.addLine(to: CGPoint(x: width, y: 0.8*height))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0.6818181818*width, y: 0.2*height))
        path.addLine(to: CGPoint(x: 0.3181818182*width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.3181818182*width, y: 0.8*height))
        path.addLine(to: CGPoint(x: 0.3181818182*width, y: 0))
        path.move(to: CGPoint(x: 0.6818181818*width, y: height))
        path.addLine(to: CGPoint(x: 0.6818181818*width, y: 0.2*height))
        return path
    }
}

struct SearchIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = Double(24)
        let height = Double(24)
        path.move(to: CGPoint(x: 0.5*width, y: height))
        path.addCurve(to: CGPoint(x: width, y: 0.5*height), control1: CGPoint(x: 0.7761423993*width, y: height), control2: CGPoint(x: width, y: 0.7761423993*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0), control1: CGPoint(x: width, y: 0.2238576186*height), control2: CGPoint(x: 0.7761423993*width, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: 0.5*height), control1: CGPoint(x: 0.2238576186*width, y: 0), control2: CGPoint(x: 0, y: 0.2238576186*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: height), control1: CGPoint(x: 0, y: 0.7761423993*height), control2: CGPoint(x: 0.2238576186*width, y: height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.5*width, y: 0.2999999857*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.7000000143*height))
        path.move(to: CGPoint(x: 0.2999999857*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0.7000000143*width, y: 0.5*height))
        return path
    }
}

struct SavedIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = Double(20)
        let height = Double(24)
        path.move(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.7222222222*height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0.1111111111*height))
        path.addCurve(to: CGPoint(x: 0.0418418816*width, y: 0.0325436857*height), control1: CGPoint(x: 0, y: 0.0816426112*height), control2: CGPoint(x: 0.0150509711*width, y: 0.0533810606*height))
        path.addCurve(to: CGPoint(x: 0.1428571429*width, y: 0), control1: CGPoint(x: 0.0686327921*width, y: 0.0117063108*height), control2: CGPoint(x: 0.1049690715*width, y: 0))
        path.addLine(to: CGPoint(x: 0.8571428571*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.9581580843*width, y: 0.0325436857*height), control1: CGPoint(x: 0.8950309285*width, y: 0), control2: CGPoint(x: 0.9313671738*width, y: 0.0117063108*height))
        path.addCurve(to: CGPoint(x: width, y: 0.1111111111*height), control1: CGPoint(x: 0.9849489949*width, y: 0.0533810606*height), control2: CGPoint(x: width, y: 0.0816426112*height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.closeSubpath()
        return path
    }
}


struct AppHeader: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                Button(action: {
                }) {
                    Image("benchPNG")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 53, height: 60)
                }
                
                Spacer()
                
                Button(action: {
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: 44, height: 44)
                        
                        Circle()
                            .stroke(Color(red: 0.275, green: 0.29, blue: 0.302), lineWidth: 2)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Image("meg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 26, height: 26)
                                    .clipShape(Circle())
                            )
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 8)
            .frame(height: 76)
            .background(Color.white)
            
            Divider()
        }
        .background(Color.white)
    }
}

struct AppFooter: View {
    @Binding var selectedTab: Int
    var onMapTapped: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack(spacing: 0) {
                Button(action: {
                    selectedTab = 0
                }) {
                    VStack {
                        Image("compass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(selectedTab == 0 ? Color(red: 0.078, green: 0.2, blue: 0.443) : Color(red: 0.275, green: 0.29, blue: 0.302))
                        Text("Events")
                            .font(.custom("Inter", size: 10))
                            .fontWeight(selectedTab == 0 ? .bold : .regular)
                            .foregroundColor(selectedTab == 0 ? Color(red: 0.078, green: 0.2, blue: 0.443) : Color(red: 0.275, green: 0.29, blue: 0.302))
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    selectedTab = 1
                    onMapTapped?()
                }) {
                    VStack {
                        Vector()
                            .stroke(selectedTab == 1 ? Color(red: 0.078, green: 0.2, blue: 0.443) : Color(red: 0.275, green: 0.29, blue: 0.302), lineWidth: 2)
                            .frame(width: 24, height: 24)
                        Text("Map")
                            .font(.custom("Inter", size: 10))
                            .fontWeight(selectedTab == 1 ? .bold : .regular)
                            .foregroundColor(selectedTab == 1 ? Color(red: 0.078, green: 0.2, blue: 0.443) : Color(red: 0.275, green: 0.29, blue: 0.302))
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    selectedTab = 2
                }) {
                    VStack {
                        SavedIcon()
                            .stroke(selectedTab == 2 ? Color(red: 0.078, green: 0.2, blue: 0.443) : Color(red: 0.275, green: 0.29, blue: 0.302), lineWidth: 2)
                            .frame(width: 24, height: 24)
                        Text("Saved")
                            .font(.custom("Inter", size: 10))
                            .fontWeight(selectedTab == 2 ? .bold : .regular)
                            .foregroundColor(selectedTab == 2 ? Color(red: 0.078, green: 0.2, blue: 0.443) : Color(red: 0.275, green: 0.29, blue: 0.302))
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 27.3)
            .padding(.top, 15.19)
            .background(Color(.systemBackground))
        }
    }
}

struct MapMarker {
    let id: String
    let position: CLLocationCoordinate2D
    let title: String
    let snippet: String?
}

struct GoogleMapView: UIViewRepresentable {
    @Binding var mapView: GMSMapView?
    @Binding var coordinator: GoogleMapView.Coordinator?
    let markers: [MapMarker]
    
    func makeCoordinator() -> Coordinator {
        let coord = Coordinator(self)
        DispatchQueue.main.async {
            self.coordinator = coord
        }
        return coord
    }
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(
            withLatitude: 40.8075,    // Columbia University area
            longitude: -73.9626,
            zoom: 14.0
        )
        
        let mapView = GMSMapView()
        mapView.camera = camera
        
        mapView.delegate = context.coordinator

        mapView.settings.compassButton = false
        mapView.settings.myLocationButton = false
        mapView.settings.zoomGestures = true
        mapView.settings.scrollGestures = true
        mapView.settings.rotateGestures = true
        mapView.settings.tiltGestures = true
        mapView.isMyLocationEnabled = false
        
        mapView.settings.indoorPicker = false
        mapView.mapType = .normal
        
        let style = """
        [
          {
            "featureType": "poi",
            "elementType": "labels",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi.business",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi.attraction",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi.government",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi.medical",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi.park",
            "stylers": [
              {
                "visibility": "on"
              }
            ]
          },
          {
            "featureType": "poi.place_of_worship",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi.school",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "poi.sports_complex",
            "stylers": [
              {
                "visibility": "off"
              }
            ]
          },
          {
            "featureType": "landscape",
            "stylers": [
              {
                "visibility": "on"
              }
            ]
          },
          {
            "featureType": "landscape.man_made",
            "stylers": [
              {
                "visibility": "on"
              }
            ]
          }
        ]
        """
        
        do {
            mapView.mapStyle = try GMSMapStyle(jsonString: style)
        } catch {
        }
        
        for markerData in markers {
            let marker = GMSMarker()
            marker.position = markerData.position
            marker.title = markerData.title
            marker.snippet = markerData.snippet
            
            let icon: UIImage?
            if markerData.id.hasPrefix("cafe_") {
                icon = createDrinkIcon()
            } else if markerData.id.hasPrefix("nypl_") {
                icon = createLibraryIcon()
            } else if markerData.id.hasPrefix("event_") {
                icon = createEventIcon()
            } else if markerData.id.hasPrefix("park_") {
                icon = createParkIcon()
            } else if markerData.id.hasPrefix("playground_") {
                icon = createPlaygroundIcon()
            } else {
                icon = createBookIcon()
            }
            
            if let customIcon = icon {
                marker.icon = customIcon
            }
            
            marker.map = mapView
        }
        
        context.coordinator.mapView = mapView
        
        DispatchQueue.main.async {
            self.mapView = mapView
        }

        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        if context.coordinator.mapView == nil {
            context.coordinator.mapView = uiView
        }
    }
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        var mapView: GMSMapView?
        var parent: GoogleMapView
        
        init(_ parent: GoogleMapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: GMSMapView, didFailToLoadWithError error: Error) {
        }
        
        func mapViewDidFinishLoadingMap(_ mapView: GMSMapView) {
        }
    }
    
    private func createBookIcon() -> UIImage? {
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)
        let bookImage = UIImage(systemName: "book.fill", withConfiguration: config)
        
        let size = CGSize(width: 35, height: 35)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(ovalIn: rect)
            UIColor(red: 0.380, green: 0.553, blue: 0.894, alpha: 1.0).setFill()
            path.fill()
            
            UIColor.white.setStroke()
            path.lineWidth = 2
            path.stroke()
            
            if let bookImage = bookImage {
                let bookSize = CGSize(width: 20, height: 15)
                let bookRect = CGRect(
                    x: (size.width - bookSize.width) / 2,
                    y: (size.height - bookSize.height) / 2,
                    width: bookSize.width,
                    height: bookSize.height
                )
                
                let whiteBookImage = bookImage.withTintColor(.white, renderingMode: .alwaysOriginal)
                whiteBookImage.draw(in: bookRect)
            }
        }
    }
    
    private func createDrinkIcon() -> UIImage? {
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)
        let drinkImage = UIImage(systemName: "cup.and.saucer.fill", withConfiguration: config)
        
        let size = CGSize(width: 35, height: 35)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(ovalIn: rect)
            UIColor(red: 0.59, green: 0.44, blue: 0.37, alpha: 1.0).setFill()
            path.fill()
            
            UIColor.white.setStroke()
            path.lineWidth = 2
            path.stroke()
            
            if let drinkImage = drinkImage {
                let drinkSize = CGSize(width: 20, height: 15)
                let drinkRect = CGRect(
                    x: (size.width - drinkSize.width) / 2,
                    y: (size.height - drinkSize.height) / 2,
                    width: drinkSize.width,
                    height: drinkSize.height
                )
                
                let whiteDrinkImage = drinkImage.withTintColor(.white, renderingMode: .alwaysOriginal)
                whiteDrinkImage.draw(in: drinkRect)
            }
        }
    }
    
    private func createLibraryIcon() -> UIImage? {
        let libraryImage = UIImage(named: "books")
        
        let size = CGSize(width: 35, height: 35)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(ovalIn: rect)
            UIColor(red: 0.4, green: 0.28, blue: 0.21, alpha: 1.0).setFill()
            path.fill()
            
            UIColor.white.setStroke()
            path.lineWidth = 2
            path.stroke()
            
            if let libraryImage = libraryImage {
                let librarySize = CGSize(width: 20, height: 20)
                let libraryRect = CGRect(
                    x: (size.width - librarySize.width) / 2,
                    y: (size.height - librarySize.height) / 2,
                    width: librarySize.width,
                    height: librarySize.height
                )
                
                let whiteLibraryImage = libraryImage.withTintColor(.white, renderingMode: .alwaysOriginal)
                whiteLibraryImage.draw(in: libraryRect)
            }
        }
    }
    
    private func createEventIcon() -> UIImage? {
        let eventImage = UIImage(named: "compass")
        
        let size = CGSize(width: 35, height: 35)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(ovalIn: rect)
            UIColor(red: 0.79, green: 0.67, blue: 0.21, alpha: 1.0).setFill()
            path.fill()
            
            UIColor.white.setStroke()
            path.lineWidth = 2
            path.stroke()
            
                if let eventImage = eventImage {
                    let eventSize = CGSize(width: 20, height: 20)
                    let eventRect = CGRect(
                        x: (size.width - eventSize.width) / 2,
                        y: (size.height - eventSize.height) / 2,
                        width: eventSize.width,
                        height: eventSize.height
                    )
                    
                    let whiteEventImage = eventImage.withTintColor(.white, renderingMode: .alwaysOriginal)
                    whiteEventImage.draw(in: eventRect)
                }
        }
    }
    
    private func createParkIcon() -> UIImage? {
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)
        let parkImage = UIImage(systemName: "tree", withConfiguration: config)
        
        let size = CGSize(width: 35, height: 35)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(ovalIn: rect)
            UIColor(red: 0.4, green: 0.7, blue: 0.41, alpha: 1.0).setFill()
            path.fill()
            
            UIColor.white.setStroke()
            path.lineWidth = 2
            path.stroke()
            
            if let parkImage = parkImage {
                let parkSize = CGSize(width: 20, height: 20)
                let parkRect = CGRect(
                    x: (size.width - parkSize.width) / 2,
                    y: (size.height - parkSize.height) / 2,
                    width: parkSize.width,
                    height: parkSize.height
                )
                
                let whiteParkImage = parkImage.withTintColor(.white, renderingMode: .alwaysOriginal)
                whiteParkImage.draw(in: parkRect)
            }
        }
    }
    
    private func createPlaygroundIcon() -> UIImage? {
        let playgroundImage = UIImage(named: "dribble")
        
        let size = CGSize(width: 35, height: 35)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(ovalIn: rect)
            UIColor(red: 0.79, green: 0.42, blue: 0.26, alpha: 1.0).setFill()
            path.fill()
            
            UIColor.white.setStroke()
            path.lineWidth = 2
            path.stroke()
            
            if let playgroundImage = playgroundImage {
                let playgroundSize = CGSize(width: 20, height: 20)
                let playgroundRect = CGRect(
                    x: (size.width - playgroundSize.width) / 2,
                    y: (size.height - playgroundSize.height) / 2,
                    width: playgroundSize.width,
                    height: playgroundSize.height
                )
                
                let whitePlaygroundImage = playgroundImage.withTintColor(.white, renderingMode: .alwaysOriginal)
                whitePlaygroundImage.draw(in: playgroundRect)
            }
        }
    }
}

struct OnboardingPage: View {
    @Binding var showOnboarding: Bool
    @Binding var showSignIn: Bool
    @Binding var showCreateAccount: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 68)
            
            Image("benchPNG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 286, height: 318)
            
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 122)
                    .foregroundColor(.clear)
                    .padding(.top, 23)
                
                Image("cgPNG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 122)
                    .padding(.top, 23)
                
                VStack {
                    Text("Welcome to")
                        .font(
                            Font.custom("Inter", size: 32)
                                .weight(.bold)
                        )
                        .foregroundColor(.black)
                    Spacer()
                }
                .frame(width: 300, height: 122)
                .padding(.top, 23)
            }
            
            Text("A platform to help you discover communities through \"third\" spaces")
                .font(Font.custom("Inter", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 333, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, -20)
                .padding(.bottom, 66)
            
            Spacer()
            
            Button(action: {
                showSignIn = true
                showOnboarding = false
            }) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 262, height: 60)
                    .background(Color(red: 0.08, green: 0.2, blue: 0.44))
                    .cornerRadius(15)
                    .overlay(
                        Text("SIGN IN")
                            .font(
                                Font.custom("Inter", size: 18)
                                    .weight(.bold)
                            )
                            .foregroundColor(.white)
                    )
            }
            .padding(.bottom, 20)
            
            Button(action: {
                showCreateAccount = true
                showOnboarding = false
            }) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 262, height: 60)
                    .background(.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .inset(by: 1)
                            .stroke(Color(red: 0.08, green: 0.2, blue: 0.44), lineWidth: 2)
                    )
                    .overlay(
                        Text("CREATE ACCOUNT")
                            .font(
                                Font.custom("Inter", size: 18)
                                    .weight(.bold)
                            )
                            .foregroundColor(Color(red: 0.08, green: 0.2, blue: 0.44))
                    )
            }
            .padding(.bottom, 50)
            }
            
            Text("!")
                .font(
                    Font.custom("Inter", size: 32)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.08, green: 0.2, blue: 0.44))
                .position(x: 325, y: 470)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignInPage: View {
    @Binding var showOnboarding: Bool
    @Binding var showSignIn: Bool
    
    var body: some View {
        ZStack {
            Button(action: {
                showOnboarding = true
                showSignIn = false
            }) {
                Image("chevron_left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            .position(x: 35, y: 69)
            
            Text("Hello,\nWelcome back!")
                .font(
                    Font.custom("Inter", size: 32)
                        .weight(.bold)
                )
                .foregroundColor(Color(red: 0.08, green: 0.2, blue: 0.44))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 23)
                .padding(.top, -91-55)
            
            VStack(alignment: .leading, spacing: 9) {
                Text("Phone Number or Email")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 23)
            .position(x: 23 + 175, y: 413+8)
            
            VStack(alignment: .leading, spacing: 9) {
                Text("Password")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 23)
            .position(x: 23 + 175, y: 413 + 9 + 20 + 37 + 8)
            
            Button(action: {
                showOnboarding = false
                showSignIn = false
            }) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 262, height: 60)
                    .background(Color(red: 0.08, green: 0.2, blue: 0.44))
                    .cornerRadius(15)
                    .overlay(
                        Text("SIGN IN")
                            .font(
                                Font.custom("Inter", size: 18)
                                    .weight(.bold)
                            )
                            .foregroundColor(.white)
                    )
            }
            .position(x: UIScreen.main.bounds.width / 2, y: 413 + 9 + 20 + 37 + 20 + 9 + 20 + 37)
            
            Button(action: {
            }) {
                Text("Forgot Password?")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
            }
            .position(x: UIScreen.main.bounds.width / 2, y: 413 + 9 + 20 + 37 + 20 + 9 + 20 + 37 + 30 + 23)
            
            Text("Or sign up with...")
                .font(Font.custom("Inter", size: 16))
                .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
                .position(x: UIScreen.main.bounds.width / 2, y: 413 + 9 + 20 + 37 + 20 + 9 + 20 + 37 + 30 + 23 + 40)
            
            ZStack {
                Button(action: {
                }) {
                    Image("apple")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                .position(x: UIScreen.main.bounds.width / 2 - 48, y: 413 + 9 + 20 + 37 + 20 + 9 + 20 + 37 + 30 + 30 + 9 + 20 + 23 + 20 + 25 - 5)
                
                Button(action: {
                }) {
                    Image("google")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                .position(x: UIScreen.main.bounds.width / 2 + 48, y: 413 + 9 + 20 + 37 + 20 + 9 + 20 + 37 + 30 + 30 + 9 + 20 + 23 + 20 + 25)
            }
            
            Image("benchPNG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 128, height: 142)
                .position(x: 23 + 64, y: 80 + 71 + 30)
            
            Image("cgPNG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 243, height: 99)
                .position(x: UIScreen.main.bounds.width - 9 - 121.5, y: 109 + 49.5 + 30)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CreateAccountPage: View {
    @Binding var showOnboarding: Bool
    @Binding var showCreateAccount: Bool
    
    private var phoneFieldY: CGFloat {
        413 + 8 - 21
    }
    
    private var passwordFieldY: CGFloat {
        phoneFieldY + 9 + 20 + 37
    }
    
    private var confirmPasswordFieldY: CGFloat {
        passwordFieldY + 9 + 20 + 37
    }
    
    private var createAccountButtonY: CGFloat {
        confirmPasswordFieldY + 96
    }
    
    private var orSignUpY: CGFloat {
        createAccountButtonY + 60
    }
    
    private var socialButtonsY: CGFloat {
        orSignUpY + 65
    }
    
    var body: some View {
        ZStack {
            Button(action: {
                showOnboarding = true
                showCreateAccount = false
            }) {
                Image("chevron_left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            .position(x: 35, y: 69)
            
            Text("Hello,\nCreate An Account")
                .font(
                    Font.custom("Inter", size: 32)
                        .weight(.bold)
                )
                .foregroundColor(Color(red: 0.08, green: 0.2, blue: 0.44))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 23)
                .padding(.top, -91-55)
            
            VStack(alignment: .leading, spacing: 9) {
                Text("Phone Number or Email")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 23)
            .position(x: 23 + 175, y: phoneFieldY)
            
            VStack(alignment: .leading, spacing: 9) {
                Text("Password")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 23)
            .position(x: 23 + 175, y: passwordFieldY)
            
            VStack(alignment: .leading, spacing: 9) {
                Text("Confirm Password")
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 23)
            .position(x: 23 + 175, y: confirmPasswordFieldY)
            
            Button(action: {
                showOnboarding = false
                showCreateAccount = false
            }) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 262, height: 60)
                    .background(Color(red: 0.08, green: 0.2, blue: 0.44))
                    .cornerRadius(15)
                    .overlay(
                        Text("SIGN UP")
                            .font(
                                Font.custom("Inter", size: 18)
                                    .weight(.bold)
                            )
                            .foregroundColor(.white)
                    )
            }
            .position(x: UIScreen.main.bounds.width / 2, y: createAccountButtonY)
                        
            Text("Or sign up with...")
                .font(Font.custom("Inter", size: 16))
                .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
                .position(x: UIScreen.main.bounds.width / 2, y: orSignUpY)
            
            ZStack {
                Button(action: {
                }) {
                    Image("apple")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                .position(x: UIScreen.main.bounds.width / 2 - 48, y: socialButtonsY - 5)
                
                Button(action: {
                }) {
                    Image("google")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                .position(x: UIScreen.main.bounds.width / 2 + 48, y: socialButtonsY)
            }
            
            Image("benchPNG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 128, height: 142)
                .position(x: 23 + 64, y: 80 + 71 + 30)
            
            Image("cgPNG")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 243, height: 99)
                .position(x: UIScreen.main.bounds.width - 9 - 121.5, y: 109 + 49.5 + 30)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct EventsPage: View {
    var body: some View {
        VStack {
            Text("Events Page")
                .font(.custom("Inter", size: 24))
                .fontWeight(.bold)
                .padding()
            
            Text("This is your events page!")
                .font(.custom("Inter", size: 16))
                .foregroundColor(.gray)
            
            Spacer()
        }
        .background(Color.white)
    }
}


struct ContentView: View {
    @State private var showOnboarding: Bool = true
    @State private var showSignIn: Bool = false
    @State private var showCreateAccount: Bool = false
    
    var body: some View {
        if showOnboarding {
            OnboardingPage(showOnboarding: $showOnboarding, showSignIn: $showSignIn, showCreateAccount: $showCreateAccount)
        } else if showSignIn {
            SignInPage(showOnboarding: $showOnboarding, showSignIn: $showSignIn)
        } else if showCreateAccount {
            CreateAccountPage(showOnboarding: $showOnboarding, showCreateAccount: $showCreateAccount)
        } else {
            MainAppView()
        }
    }
}

