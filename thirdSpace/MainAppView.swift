
import SwiftUI
import GoogleMaps

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }   
}


struct PlaceDetailPopup: View {
    let place: MapMarker
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            // Background overlay for list view
            Color.black.opacity(0.4)
                .ignoresSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            // Full popup for list view
                VStack(spacing: 0) {
                // Image section
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 300)
                    .background(
                        Image(
                            place.id.hasPrefix("bookstore_") ? "bookstore" :
                            place.id.hasPrefix("cafe_") ? "drinks" :
                            place.id.hasPrefix("park_") ? "parkGarden" :
                            place.id.hasPrefix("museum_") ? "musee" :
                            place.id.hasPrefix("playground_") ? "plays" :
                            place.id.hasPrefix("event_") ? "party" :
                            "nypl"
                        )
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                    )
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                
                // Content section
                VStack(alignment: .leading, spacing: 0) {
                    // Back button and close button
                    HStack {
                        Button(action: {
                            isPresented = false
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 16))
                                Text("Back")
                                    .font(Font.custom("Inter", size: 16))
                                    .fontWeight(.medium)
                            }
                            .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            isPresented = false
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 20))
                                .foregroundColor(Color(red: 0.275, green: 0.29, blue: 0.302))
                                .frame(width: 44, height: 44)
                        }
                    }
                    .padding(.top, 8)
                    .padding(.horizontal, 20)
                    
                    // Title/Medium - right below the image
                    Text(place.title)
                        .font(
                            Font.custom("Inter", size: 24)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                        .padding(.top, 16)
                        .padding(.horizontal, 20)
                    
                    // Description/Medium - Rating
                    Text("4.0 (253 Reviews)")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                        .padding(.top, 8)
                        .padding(.horizontal, 20)
                    
                    // Description/Medium - Hours
                    Text("Opens Today 10 AM - 6 PM")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                        .padding(.top, 4)
                        .padding(.horizontal, 20)
                    
                    // Description/Medium - Address
                    Text(place.snippet ?? "2900 Broadway, New York, NY \n10025 USA")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                        .padding(.top, 4)
                        .padding(.horizontal, 20)
                    
                    // Names/Medium - What you need to know
                    Text("What you need to know...")
                        .font(
                            Font.custom("Inter", size: 18)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                        .padding(.top, 16)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                }
                .background(Color.white)
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
            }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.top, 76) // Position below the header
            }
        }
    }

struct MainAppView: View {
    @State private var mapView: GMSMapView?
    @State private var coordinator: GoogleMapView.Coordinator?
    @State private var currentPage: Int = 1
    @State private var showPlacesDropdown: Bool = false
    @State private var selectedCategory: String? = nil
    @State private var isMapView: Bool = true
    @State private var savedItems: Set<String> = []
    @State private var shuffledMarkers: [MapMarker] = []
    @State private var showProfile: Bool = false
    @State private var showPlacePopup: Bool = false
    @State private var selectedPlace: MapMarker? = nil
    @State private var tapLocation: CGPoint = .zero
    
    private var filteredMarkers: [MapMarker] {
        let markersToUse = shuffledMarkers.isEmpty ? sampleMarkers : shuffledMarkers
        
        if let category = selectedCategory {
            return markersToUse.filter { marker in
                switch category {
                case "bookstores":
                    return marker.id.hasPrefix("bookstore_")
                case "cafes":
                    return marker.id.hasPrefix("cafe_")
                case "events":
                    return marker.id.hasPrefix("event_")
                case "libraries":
                    return marker.id.hasPrefix("nypl_")
                case "museums & galleries":
                    return marker.id.hasPrefix("museum_")
                case "parks & gardens":
                    return marker.id.hasPrefix("park_")
                case "playgrounds":
                    return marker.id.hasPrefix("playground_")
                default:
                    return false
                }
            }
        } else {
            return markersToUse
        }
    }
    
    private let sampleMarkers: [MapMarker] = [
        MapMarker(
            id: "nypl_1",
            position: CLLocationCoordinate2D(latitude: 40.7532, longitude: -73.9822),
            title: "Stephen A. Schwarzman Building",
            snippet: "476 5th Ave, New York, NY 10018"
        ),
        MapMarker(
            id: "nypl_2",
            position: CLLocationCoordinate2D(latitude: 40.80682670809147, longitude: -73.96402902331009),
            title: "Morningside Heights Library",
            snippet: "2900 Broadway, New York, NY 10025"
        ),
        MapMarker(
            id: "nypl_3",
            position: CLLocationCoordinate2D(latitude: 40.7505, longitude: -73.9844),
            title: "Mid-Manhattan Library",
            snippet: "455 5th Ave, New York, NY 10016"
        ),
        MapMarker(
            id: "nypl_4",
            position: CLLocationCoordinate2D(latitude: 40.7189, longitude: -73.9789),
            title: "Hamilton Fish Park Library",
            snippet: "415 E Houston St, New York, NY 10002"
        ),
        MapMarker(
            id: "nypl_5",
            position: CLLocationCoordinate2D(latitude: 40.7614, longitude: -73.9776),
            title: "53rd Street Library",
            snippet: "18 W 53rd St, New York, NY 10019"
        ),
        MapMarker(
            id: "nypl_6",
            position: CLLocationCoordinate2D(latitude: 40.7639, longitude: -73.9708),
            title: "58th Street Library",
            snippet: "127 E 58th St, New York, NY 10022"
        ),
        MapMarker(
            id: "nypl_7",
            position: CLLocationCoordinate2D(latitude: 40.7706, longitude: -73.9583),
            title: "67th Street Library",
            snippet: "328 E 67th St, New York, NY 10065"
        ),
        MapMarker(
            id: "nypl_8",
            position: CLLocationCoordinate2D(latitude: 40.7892, longitude: -73.9508),
            title: "96th Street Library",
            snippet: "112 E 96th St, New York, NY 10128"
        ),
        MapMarker(
            id: "nypl_9",
            position: CLLocationCoordinate2D(latitude: 40.7892, longitude: -73.9508),
            title: "Aguilar Library",
            snippet: "174 E 110th St, New York, NY 10029"
        ),
        MapMarker(
            id: "nypl_10",
            position: CLLocationCoordinate2D(latitude: 40.7505, longitude: -73.9844),
            title: "Andrew Heiskell Braille Library",
            snippet: "40 W 20th St, New York, NY 10011"
        ),
        MapMarker(
            id: "nypl_11",
            position: CLLocationCoordinate2D(latitude: 40.7112, longitude: -74.0162),
            title: "Battery Park City Library",
            snippet: "175 North End Ave, New York, NY 10282"
        ),
        MapMarker(
            id: "nypl_12",
            position: CLLocationCoordinate2D(latitude: 40.7142, longitude: -73.9981),
            title: "Chatham Square Library",
            snippet: "33 E Broadway, New York, NY 10002"
        ),
        MapMarker(
            id: "nypl_13",
            position: CLLocationCoordinate2D(latitude: 40.7689, longitude: -73.9819),
            title: "Columbus Library",
            snippet: "742 10th Ave, New York, NY 10019"
        ),
        MapMarker(
            id: "nypl_14",
            position: CLLocationCoordinate2D(latitude: 40.8084, longitude: -73.9508),
            title: "Countee Cullen Library",
            snippet: "104 W 136th St, New York, NY 10030"
        ),
        MapMarker(
            id: "nypl_15",
            position: CLLocationCoordinate2D(latitude: 40.7505, longitude: -73.9844),
            title: "Epiphany Library",
            snippet: "228 E 23rd St, New York, NY 10010"
        ),
        MapMarker(
            id: "nypl_16",
            position: CLLocationCoordinate2D(latitude: 40.8508, longitude: -73.9375),
            title: "Fort Washington Library",
            snippet: "535 W 179th St, New York, NY 10033"
        ),
        MapMarker(
            id: "nypl_17",
            position: CLLocationCoordinate2D(latitude: 40.8084, longitude: -73.9508),
            title: "George Bruce Library",
            snippet: "518 W 125th St, New York, NY 10027"
        ),
        MapMarker(
            id: "nypl_18",
            position: CLLocationCoordinate2D(latitude: 40.7505, longitude: -73.9844),
            title: "Grand Central Library",
            snippet: "135 E 46th St, New York, NY 10017"
        ),
        MapMarker(
            id: "nypl_19",
            position: CLLocationCoordinate2D(latitude: 40.8084, longitude: -73.9508),
            title: "Hamilton Grange Library",
            snippet: "503 W 145th St, New York, NY 10031"
        ),
        MapMarker(
            id: "nypl_20",
            position: CLLocationCoordinate2D(latitude: 40.8084, longitude: -73.9508),
            title: "Harlem Library",
            snippet: "9 W 124th St, New York, NY 10027"
        ),
        MapMarker(
            id: "nypl_21",
            position: CLLocationCoordinate2D(latitude: 40.7339, longitude: -74.0025),
            title: "Hudson Park Library",
            snippet: "66 Leroy St, New York, NY 10014"
        ),
        MapMarker(
            id: "nypl_22",
            position: CLLocationCoordinate2D(latitude: 40.8667, longitude: -73.9208),
            title: "Inwood Library",
            snippet: "4790 Broadway, New York, NY 10034"
        ),
        MapMarker(
            id: "nypl_23",
            position: CLLocationCoordinate2D(latitude: 40.7339, longitude: -74.0025),
            title: "Jefferson Market Library",
            snippet: "425 6th Ave, New York, NY 10011"
        ),
        MapMarker(
            id: "nypl_24",
            position: CLLocationCoordinate2D(latitude: 40.7505, longitude: -73.9844),
            title: "Kips Bay Library",
            snippet: "446 3rd Ave, New York, NY 10016"
        ),
        MapMarker(
            id: "nypl_25",
            position: CLLocationCoordinate2D(latitude: 40.8084, longitude: -73.9508),
            title: "Macomb's Bridge Library",
            snippet: "2650 Adam Clayton Powell Jr Blvd, New York, NY 10039"
        ),
        MapMarker(
            id: "nypl_26",
            position: CLLocationCoordinate2D(latitude: 40.8084, longitude: -73.9508),
            title: "Muhlenberg Library",
            snippet: "209 W 23rd St, New York, NY 10011"
        ),
        MapMarker(
            id: "nypl_27",
            position: CLLocationCoordinate2D(latitude: 40.7505, longitude: -73.9844),
            title: "New Amsterdam Library",
            snippet: "9 Murray St, New York, NY 10007"
        ),
        MapMarker(
            id: "nypl_28",
            position: CLLocationCoordinate2D(latitude: 40.7339, longitude: -73.9903),
            title: "Ottendorfer Library",
            snippet: "135 2nd Ave, New York, NY 10003"
        ),
        MapMarker(
            id: "nypl_29",
            position: CLLocationCoordinate2D(latitude: 40.8333, longitude: -73.8667),
            title: "Parkchester Library",
            snippet: "1985 Westchester Ave, Bronx, NY 10462"
        ),
        MapMarker(
            id: "nypl_30",
            position: CLLocationCoordinate2D(latitude: 40.8667, longitude: -73.8000),
            title: "Pelham Bay Library",
            snippet: "3060 Middletown Rd, Bronx, NY 10461"
        ),
        MapMarker(
            id: "nypl_31",
            position: CLLocationCoordinate2D(latitude: 40.7833, longitude: -73.9833),
            title: "Riverside Library",
            snippet: "127 Amsterdam Ave, New York, NY 10023"
        ),
        MapMarker(
            id: "nypl_32",
            position: CLLocationCoordinate2D(latitude: 40.7142, longitude: -73.9903),
            title: "Seward Park Library",
            snippet: "192 E Broadway, New York, NY 10002"
        ),
        MapMarker(
            id: "nypl_33",
            position: CLLocationCoordinate2D(latitude: 40.8084, longitude: -73.9508),
            title: "St. Agnes Library",
            snippet: "444 Amsterdam Ave, New York, NY 10023"
        ),
        MapMarker(
            id: "nypl_34",
            position: CLLocationCoordinate2D(latitude: 40.6431, longitude: -74.0764),
            title: "St. George Library Center",
            snippet: "5 Central Ave, Staten Island, NY 10301"
        ),
        MapMarker(
            id: "nypl_35",
            position: CLLocationCoordinate2D(latitude: 40.7258, longitude: -73.9808),
            title: "Tompkins Square Library",
            snippet: "331 E 10th St, New York, NY 10009"
        ),
        MapMarker(
            id: "nypl_36",
            position: CLLocationCoordinate2D(latitude: 40.8500, longitude: -73.9000),
            title: "Tremont Library",
            snippet: "1866 Washington Ave, Bronx, NY 10457"
        ),
        MapMarker(
            id: "nypl_37",
            position: CLLocationCoordinate2D(latitude: 40.8833, longitude: -73.8833),
            title: "Van Cortlandt Library",
            snippet: "3882 Cannon Pl, Bronx, NY 10463"
        ),
        MapMarker(
            id: "nypl_38",
            position: CLLocationCoordinate2D(latitude: 40.8508, longitude: -73.9375),
            title: "Washington Heights Library",
            snippet: "1000 St Nicholas Ave, New York, NY 10032"
        ),
        MapMarker(
            id: "nypl_39",
            position: CLLocationCoordinate2D(latitude: 40.7505, longitude: -73.9844),
            title: "Webster Library",
            snippet: "1465 York Ave, New York, NY 10075"
        ),
        MapMarker(
            id: "nypl_40",
            position: CLLocationCoordinate2D(latitude: 40.7750, longitude: -73.9500),
            title: "Yorkville Library",
            snippet: "222 E 79th St, New York, NY 10021"
        ),
        MapMarker(
            id: "cafe_1",
            position: CLLocationCoordinate2D(latitude: 40.8084, longitude: -73.9625),
            title: "Blue Bottle Coffee",
            snippet: "2790 Broadway, New York, NY 10025"
        ),
        MapMarker(
            id: "cafe_2",
            position: CLLocationCoordinate2D(latitude: 40.8101, longitude: -73.9621),
            title: "Joe Coffee",
            snippet: "2790 Broadway, New York, NY 10025"
        ),
        MapMarker(
            id: "cafe_3",
            position: CLLocationCoordinate2D(latitude: 40.8084, longitude: -73.9625),
            title: "Hungarian Pastry Shop",
            snippet: "1030 Amsterdam Ave, New York, NY 10025"
        ),
        MapMarker(
            id: "cafe_4",
            position: CLLocationCoordinate2D(latitude: 40.8059, longitude: -73.9539),
            title: "Double Dutch Espresso",
            snippet: "2194 Frederick Douglass Blvd, New York, NY 10026"
        ),
        MapMarker(
            id: "cafe_5",
            position: CLLocationCoordinate2D(latitude: 40.8056, longitude: -73.9654),
            title: "Oren's Coffee",
            snippet: "2680 Broadway, New York, NY 10025"
        ),
        MapMarker(
            id: "cafe_6",
            position: CLLocationCoordinate2D(latitude: 40.8068, longitude: -73.9652),
            title: "Hex & Company",
            snippet: "2911 Broadway, New York, NY 10025"
        ),
        MapMarker(
            id: "cafe_7",
            position: CLLocationCoordinate2D(latitude: 40.8080, longitude: -73.9644),
            title: "Pret A Manger",
            snippet: "2955 Broadway, New York, NY 10025"
        ),
        MapMarker(
            id: "cafe_8",
            position: CLLocationCoordinate2D(latitude: 40.8100, longitude: -73.9438),
            title: "787 Coffee Co.",
            snippet: "60 W 129th St, New York, NY 10027"
        ),
        MapMarker(
            id: "cafe_9",
            position: CLLocationCoordinate2D(latitude: 40.8142, longitude: -73.9601),
            title: "Kuro Kuma Espresso",
            snippet: "121 La Salle St, New York, NY 10027"
        ),
        MapMarker(
            id: "cafe_10",
            position: CLLocationCoordinate2D(latitude: 40.8138, longitude: -73.9557),
            title: "Plowshares Coffee Roasters",
            snippet: "1351 Amsterdam Ave, New York, NY 10027"
        ),
        MapMarker(
            id: "bookstore_1",
            position: CLLocationCoordinate2D(latitude: 40.80705087432473, longitude: -73.96496953783681),
            title: "Book Culture",
            snippet: "Book Culture - Columbia University Area"
        ),
        MapMarker(
            id: "bookstore_2",
            position: CLLocationCoordinate2D(latitude: 40.80540904565085, longitude: -73.96479738863673),
            title: "Book Culture",
            snippet: "Book Culture - Columbia University Area"
        ),
        MapMarker(
            id: "bookstore_3",
            position: CLLocationCoordinate2D(latitude: 40.80700839378224, longitude: -73.96402942939555),
            title: "Lerner",
            snippet: "Lerner Bookstore - Columbia University Area"
        ),
        MapMarker(
            id: "event_1",
            position: CLLocationCoordinate2D(latitude: 40.81051842524234, longitude: -73.96207790894304),
            title: "Princess Polly",
            snippet: "Princess Polly Event - Columbia University Area"
        ),
        MapMarker(
            id: "event_2",
            position: CLLocationCoordinate2D(latitude: 40.80481536553076, longitude: -73.96228769136712),
            title: "Edikted",
            snippet: "Edikted Event - Columbia University Area"
        ),
        MapMarker(
            id: "event_3",
            position: CLLocationCoordinate2D(latitude: 40.806165089836355, longitude: -73.95956052038397),
            title: "Japanfest",
            snippet: "Japanfest Event - Columbia University Area"
        ),
        MapMarker(
            id: "park_1",
            position: CLLocationCoordinate2D(latitude: 40.8093, longitude: -73.9671),
            title: "Riverside Park",
            snippet: "Riverside Park - Columbia University Area"
        ),
        MapMarker(
            id: "park_2",
            position: CLLocationCoordinate2D(latitude: 40.80612141920188, longitude: -73.95847246180041),
            title: "Morningside Park",
            snippet: "Morningside Park - Columbia University Area"
        ),
        MapMarker(
            id: "park_3",
            position: CLLocationCoordinate2D(latitude: 40.80341647498478, longitude: -73.96288292371062),
            title: "West 111th Garden",
            snippet: "West 111th Garden - Columbia University Area"
        ),
        MapMarker(
            id: "playground_1",
            position: CLLocationCoordinate2D(latitude: 40.80082788768537, longitude: -73.96402226946938),
            title: "Booker T",
            snippet: "Booker T Playground - Columbia University Area"
        ),
        MapMarker(
            id: "playground_2",
            position: CLLocationCoordinate2D(latitude: 40.80822756102717, longitude: -73.96754088841602),
            title: "Riverside Playground",
            snippet: "Riverside Playground - Columbia University Area"
        )
    ]
    
    var body: some View {
        Group {
            if showProfile {
            // Profile Page
            VStack(spacing: 0) {
                // Header with just logo and CG
                HStack(alignment: .center) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 35, height: 38)
                        .background(
                            Image("benchPNG")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 38)
                                .clipped()
                        )
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 168, height: 30)
                        .background(
                            Image("cgPNG")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 168, height: 30)
                                .clipped()
                        )
                        .padding(.leading, -20)
                    
                    Spacer()
                    
                    Button(action: {
                        showProfile = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 0.275, green: 0.29, blue: 0.302))
                            .frame(width: 44, height: 44)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 8)
                .frame(height: 76)
                .background(Color.white)
                
                Divider()
                
                ScrollView {
                    VStack(spacing: 0) {
                        // Profile Picture
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 100, height: 100)
                            .background(
                                Image("meg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                            )
                            .cornerRadius(100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .inset(by: -1)
                                    .stroke(Color(red: 0.74, green: 0.82, blue: 0.98), lineWidth: 2)
                            )
                            .padding(.top, 104)
                        
                        // Username
                        Text("@MeganLovesPeople")
                            .font(
                                Font.custom("Inter", size: 18)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.black)
                            .padding(.top, 16)
                        
                        // Bio
                        Text("looking for a park buddy <3")
                            .font(Font.custom("Roboto", size: 16))
                            .foregroundColor(Color(red: 0.48, green: 0.49, blue: 0.5))
                            .padding(.top, 8)
                        
                        // Stats
                        HStack(spacing: 32) {
                            VStack {
                                Text("Friends")
                                    .font(Font.custom("Inter", size: 16))
                                    .foregroundColor(.black)
                                Text("42")
                                    .font(Font.custom("Inter", size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            
                            VStack {
                                Text("Following")
                                    .font(Font.custom("Inter", size: 16))
                                    .foregroundColor(.black)
                                Text("156")
                                    .font(Font.custom("Inter", size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.top, 24)
                        
                        // Edit Profile Button
                        Button(action: {
                            // Edit profile action
                        }) {
                            Text("Edit Profile")
                                .font(Font.custom("Inter", size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 44)
                                .background(Color(red: 0.16, green: 0.17, blue: 0.18))
                                .cornerRadius(22)
                        }
                        .padding(.top, 24)
                        
                        // Your Recent Reviews
                        Text("Your Recent Reviews")
                            .font(
                                Font.custom("Inter", size: 20)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                            .padding(.top, 32)
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer(minLength: 100)
                    }
                }
                .background(Color.white)
            }
        } else {
            // Main App Content
            ZStack {
                VStack(spacing: 0) {
                HStack(alignment: .center) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 35, height: 38)
                        .background(
                            Image("benchPNG")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 38)
                                .clipped()
                        )
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 168, height: 30)
                        .background(
                            Image("cgPNG")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 168, height: 30)
                                .clipped()
                        )
                        .padding(.leading, -20)
                    
                    Spacer()
                    
                    Button(action: {
                        showProfile.toggle()
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
                .zIndex(1001) // Keep header above popup
                
                Divider()
            
            if currentPage == 1 && !showPlacePopup {
                Button(action: {
                    if showPlacesDropdown {
                        selectedCategory = nil
                    }
                    showPlacesDropdown.toggle()
                }) {
                    HStack {
                        Text(selectedCategory == nil ? "Places" : selectedCategory!.capitalized)
                            .font(
                                Font.custom("Inter", size: 32)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                        
                        Image("chevron_left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 30)
                            .rotationEffect(.degrees(270))
                            .padding(.leading, 8)
                        
                        Spacer()
                    }
                }
                .padding(.leading, 21)
                .padding(.top, 8)
                .padding(.bottom, 8)
            }
            
            if showPlacesDropdown && !showPlacePopup {
                VStack(alignment: .leading, spacing: 0) {
                    let placeTypes = ["bookstores", "cafes", "events", "libraries", "museums & galleries", "parks & gardens", "playgrounds"]
                    
                    Spacer()
                    
                            ForEach(Array(placeTypes.enumerated()), id: \.offset) { index, placeType in
                                Button(action: {
                                    selectedCategory = placeType
                                    showPlacesDropdown = false
                                }) {
                            HStack {
                                if placeType == "bookstores" {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 40, height: 40)
                                        .background(Color(red: 0.38, green: 0.55, blue: 0.89))
                                        .cornerRadius(40)
                                        .overlay(
                                            Image(systemName: "book.fill")
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                        )
                                        .padding(.trailing, 12)
                                }
                                
                                if placeType == "cafes" {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 40, height: 40)
                                        .background(Color(red: 0.59, green: 0.44, blue: 0.37))
                                        .cornerRadius(40)
                                        .overlay(
                                            Image(systemName: "cup.and.saucer.fill")
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                        )
                                        .padding(.trailing, 12)
                                }
                                
                                if placeType == "events" {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 40, height: 40)
                                        .background(Color(red: 0.79, green: 0.67, blue: 0.21))
                                        .cornerRadius(40)
                                        .overlay(
                                            Rectangle()
                                                .fill(Color.white)
                                                .frame(width: 20, height: 20)
                                                .mask(
                                                    Image("compass")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 20, height: 20)
                                                )
                                        )
                                        .padding(.trailing, 12)
                                }
                                
                                if placeType == "libraries" {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 40, height: 40)
                                        .background(Color(red: 0.4, green: 0.28, blue: 0.21))
                                        .cornerRadius(40)
                                        .overlay(
                                            Rectangle()
                                                .fill(Color.white)
                                                .frame(width: 20, height: 20)
                                                .mask(
                                                    Image("books")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 20, height: 20)
                                                )
                                        )
                                        .padding(.trailing, 12)
                                }
                                
                                if placeType == "museums & galleries" {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 40, height: 40)
                                        .background(Color(red: 0.71, green: 0.24, blue: 0.15))
                                        .cornerRadius(40)
                                        .overlay(
                                            Rectangle()
                                                .fill(Color.white)
                                                .frame(width: 20, height: 20)
                                                .mask(
                                                    Image("museum")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 20, height: 20)
                                                )
                                        )
                                        .padding(.trailing, 12)
                                }
                                
                                if placeType == "parks & gardens" {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 40, height: 40)
                                        .background(Color(red: 0.4, green: 0.7, blue: 0.41))
                                        .cornerRadius(40)
                                        .overlay(
                                            Image(systemName: "tree")
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                        )
                                        .padding(.trailing, 12)
                                }
                                
                                if placeType == "playgrounds" {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 40, height: 40)
                                        .background(Color(red: 0.79, green: 0.42, blue: 0.26))
                                        .cornerRadius(40)
                                        .overlay(
                                            Rectangle()
                                                .fill(Color.white)
                                                .frame(width: 20, height: 20)
                                                .mask(
                                                    Image("dribble")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 20, height: 20)
                                                )
                                        )
                                        .padding(.trailing, 12)
                                }
                                
                                Text(placeType.capitalized)
                                    .font(
                                        Font.custom("Inter", size: 24)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(Color(red: 0.27, green: 0.29, blue: 0.3))
                                    .lineLimit(1)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 21)
                            .padding(.vertical, 20)
                            .background(Color.white)
                        }
                        
                        if index < placeTypes.count - 1 {
                            Spacer()
                        }
                    }
                    
                    Spacer()
                }
                .background(Color.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if currentPage == 0 {
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
                } else if currentPage == 1 {
                // Map/List View Toggle
                HStack(spacing: 0) {
                    Button(action: {
                        isMapView = true
                    }) {
                        Text("Map View")
                            .font(
                                Font.custom("Inter", size: 18)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(isMapView ? Color(red: 0.08, green: 0.2, blue: 0.44) : Color.gray)
                            .frame(width: 196, height: 16, alignment: .top)
                            .overlay(
                                Rectangle()
                                    .fill(isMapView ? Color(red: 0.08, green: 0.2, blue: 0.44) : Color.clear)
                                    .frame(height: 2)
                                    .offset(y: 15),
                                alignment: .bottom
                            )
                    }
                    
                    Button(action: {
                        isMapView = false
                    }) {
                        Text("List View")
                            .font(
                                Font.custom("Inter", size: 18)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(!isMapView ? Color(red: 0.08, green: 0.2, blue: 0.44) : Color.gray)
                            .frame(width: 196, height: 16, alignment: .top)
                            .overlay(
                                Rectangle()
                                    .fill(!isMapView ? Color(red: 0.08, green: 0.2, blue: 0.44) : Color.clear)
                                    .frame(height: 2)
                                    .offset(y: 15),
                                alignment: .bottom
                            )
                    }
                }
                .padding(.vertical, 16)
                .background(Color.white)
                
                if isMapView {
                ZStack {
                    GoogleMapView(
                        mapView: $mapView,
                        coordinator: $coordinator,
                        markers: filteredMarkers,
                        onMarkerTap: { marker, point in
                            // Update the selected place and tap location for the card
                            selectedPlace = marker
                            // Position the card at the marker's screen location
                            tapLocation = point
                        },
                        onMapTap: { point in
                            // Update tap location when map is tapped
                            tapLocation = point
                        }
                    )
                    
                    // Simple card overlay for map view
                    if let place = selectedPlace {
                        VStack {
                            Spacer()
                            
                            HStack {
                                Spacer()
                                
                                Text(place.title)
                                    .font(
                                        Font.custom("Inter", size: 16)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 12)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    .onTapGesture {
                                        selectedPlace = nil
                                    }
                                    .position(x: tapLocation.x, y: tapLocation.y)
                                
                                Spacer()
                            }
                            
                            Spacer()
                        }
                    }
                }
                    .id(selectedCategory)
                    .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
                } else {
                    // List View
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(filteredMarkers, id: \.id) { marker in
                                Button(action: {
                                    selectedPlace = marker
                                    showPlacePopup = true
                                }) {
                                    ZStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 361, height: 200)
                                        .background(
                                            Image(
                                                marker.id.hasPrefix("bookstore_") ? "bookstore" :
                                                marker.id.hasPrefix("cafe_") ? "drinks" :
                                                marker.id.hasPrefix("park_") ? "parkGarden" :
                                                marker.id.hasPrefix("museum_") ? "musee" :
                                                marker.id.hasPrefix("playground_") ? "plays" :
                                                marker.id.hasPrefix("event_") ? "party" :
                                                "nypl"
                                            )
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 361, height: 200)
                                                .clipped()
                                        )
                                        .cornerRadius(20)
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Spacer()
                                            .frame(height: 94)
                                        
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 361, height: 106)
                                            .background(.white)
                                            .cornerRadius(20)
                                            .overlay(
                                                ZStack {
                                                    VStack(alignment: .leading, spacing: 9) {
                                                        // Title/Small
                                                        Text(marker.title)
                                                            .font(
                                                                Font.custom("Inter", size: 18)
                                                                    .weight(.medium)
                                                            )
                                                            .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                                        
                                                        // Description/Small
                                                        Text("Open 10 AM - 6 PM")
                                                            .font(Font.custom("Inter", size: 12))
                                                            .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                                        
                                                        // Rating and Distance
                                                        HStack(spacing: 16) {
                                                            HStack(spacing: 4) {
                                                                Image(systemName: "star.fill")
                                                                    .font(.system(size: 12))
                                                                    .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                                                
                                                                Text("4.5")
                                                                    .font(Font.custom("Inter", size: 12))
                                                                    .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                                            }
                                                            
                                                            HStack(spacing: 4) {
                                                                Image(systemName: "location")
                                                                    .font(.system(size: 12))
                                                                    .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                                                
                                                                Text("0.3 mi")
                                                                    .font(Font.custom("Inter", size: 12))
                                                                    .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                                            }
                                                            
                                                            Spacer()
                                                        }
                                                        
                                                        Spacer()
                                                    }
                                                    .padding(.leading, 55) // 7px (icon position) + 40px (icon width) + 8px (reduced spacing)
                                                    .padding(.trailing, 20)
                                                    .padding(.vertical, 16)
                                                    
                                                    // Save Icon - positioned at bottom right
                                                    VStack {
                                                        Spacer()
                                                        HStack {
                                                            Spacer()
                                                            Button(action: {
                                                                if savedItems.contains(marker.id) {
                                                                    savedItems.remove(marker.id)
                                                                } else {
                                                                    savedItems.insert(marker.id)
                                                                }
                                                            }) {
                                                                Image(systemName: savedItems.contains(marker.id) ? "bookmark.fill" : "bookmark")
                                                                    .font(.system(size: 20))
                                                                    .foregroundColor(savedItems.contains(marker.id) ? Color.blue : Color(red: 0.16, green: 0.17, blue: 0.18))
                                                                    .frame(width: 24, height: 24)
                                                            }
                                                            .padding(.trailing, 16)
                                                            .padding(.bottom, 16)
                                                        }
                                                    }
                                                    
                                                    // Category Icon - positioned 7px from the start of the rectangle
                                                    HStack {
                                                        VStack {
                                                            if marker.id.hasPrefix("bookstore_") {
                                                                Rectangle()
                                                                    .foregroundColor(.clear)
                                                                    .frame(width: 40, height: 40)
                                                                    .background(Color(red: 0.38, green: 0.55, blue: 0.89))
                                                                    .cornerRadius(40)
                                                                    .overlay(
                                                                        Image(systemName: "book.fill")
                                                                            .font(.system(size: 20))
                                                                            .foregroundColor(.white)
                                                                    )
                                                            } else if marker.id.hasPrefix("cafe_") {
                                                                Rectangle()
                                                                    .foregroundColor(.clear)
                                                                    .frame(width: 40, height: 40)
                                                                    .background(Color(red: 0.59, green: 0.44, blue: 0.37))
                                                                    .cornerRadius(40)
                                                                    .overlay(
                                                                        Image(systemName: "cup.and.saucer.fill")
                                                                            .font(.system(size: 20))
                                                                            .foregroundColor(.white)
                                                                    )
                                                            } else if marker.id.hasPrefix("event_") {
                                                                Rectangle()
                                                                    .foregroundColor(.clear)
                                                                    .frame(width: 40, height: 40)
                                                                    .background(Color(red: 0.79, green: 0.67, blue: 0.21))
                                                                    .cornerRadius(40)
                                                                    .overlay(
                                                                        Rectangle()
                                                                            .fill(Color.white)
                                                                            .frame(width: 20, height: 20)
                                                                            .mask(
                                                                                Image("compass")
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fit)
                                                                                    .frame(width: 20, height: 20)
                                                                            )
                                                                    )
                                                            } else if marker.id.hasPrefix("nypl_") {
                                                                Rectangle()
                                                                    .foregroundColor(.clear)
                                                                    .frame(width: 40, height: 40)
                                                                    .background(Color(red: 0.4, green: 0.28, blue: 0.21))
                                                                    .cornerRadius(40)
                                                                    .overlay(
                                                                        Rectangle()
                                                                            .fill(Color.white)
                                                                            .frame(width: 20, height: 20)
                                                                            .mask(
                                                                                Image("books")
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fit)
                                                                                    .frame(width: 20, height: 20)
                                                                            )
                                                                    )
                                                            } else if marker.id.hasPrefix("museum_") {
                                                                Rectangle()
                                                                    .foregroundColor(.clear)
                                                                    .frame(width: 40, height: 40)
                                                                    .background(Color(red: 0.71, green: 0.24, blue: 0.15))
                                                                    .cornerRadius(40)
                                                                    .overlay(
                                                                        Rectangle()
                                                                            .fill(Color.white)
                                                                            .frame(width: 20, height: 20)
                                                                            .mask(
                                                                                Image("museum")
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fit)
                                                                                    .frame(width: 20, height: 20)
                                                                            )
                                                                    )
                                                            } else if marker.id.hasPrefix("park_") {
                                                                Rectangle()
                                                                    .foregroundColor(.clear)
                                                                    .frame(width: 40, height: 40)
                                                                    .background(Color(red: 0.4, green: 0.7, blue: 0.41))
                                                                    .cornerRadius(40)
                                                                    .overlay(
                                                                        Image(systemName: "tree")
                                                                            .font(.system(size: 20))
                                                                            .foregroundColor(.white)
                                                                    )
                                                            } else if marker.id.hasPrefix("playground_") {
                                                                Rectangle()
                                                                    .foregroundColor(.clear)
                                                                    .frame(width: 40, height: 40)
                                                                    .background(Color(red: 0.79, green: 0.42, blue: 0.26))
                                                                    .cornerRadius(40)
                                                                    .overlay(
                                                                        Rectangle()
                                                                            .fill(Color.white)
                                                                            .frame(width: 20, height: 20)
                                                                            .mask(
                                                                                Image("dribble")
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fit)
                                                                                    .frame(width: 20, height: 20)
                                                                            )
                                                                    )
                                                            }
                                                            
                                                            Spacer()
                                                        }
                                                        .padding(.leading, 7)
                                                        .padding(.top, 16)
                                                        
                                                        Spacer()
                                                    }
                                                }
                                            )
                                    }
                                }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    }
                    .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                }
                } else if currentPage == 2 {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        // Title/Large
                        Text("My Lists")
                            .font(
                                Font.custom("Inter", size: 32)
                                    .weight(.bold)
                            )
                            .foregroundColor(.black)
                            .padding(.top, 19)
                            .padding(.leading, 21)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Plus button action
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 18.6, weight: .medium))
                            .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                            .frame(width: 18.6, height: 18.6)
                    }
                    .padding(.top, 19)
                    .padding(.trailing, 17)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                            .padding(.top, 16)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            // Title/Small
                            Text("My Favorite Spots <3")
                                .font(
                                    Font.custom("Inter", size: 18)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                .padding(.top, 16)
                            
                            // Description/Small
                            Text("269 places")
                                .font(Font.custom("Inter", size: 12))
                                .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                .padding(.top, 4)
                        }
                        
                        Spacer()
                    }
                    .padding(.leading, 21)
                    
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                            .padding(.top, 16)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            // Title/Small
                            Text("Want to Go")
                                .font(
                                    Font.custom("Inter", size: 18)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                .padding(.top, 16)
                            
                            // Description/Small
                            Text("194 places")
                                .font(Font.custom("Inter", size: 12))
                                .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                .padding(.top, 4)
                        }
                        
                        Spacer()
                    }
                    .padding(.leading, 21)
                    
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                            .padding(.top, 16)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            // Title/Small
                            Text("Columbia Spots")
                                .font(
                                    Font.custom("Inter", size: 18)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                .padding(.top, 16)
                            
                            // Description/Small
                            Text("34 places")
                                .font(Font.custom("Inter", size: 12))
                                .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                .padding(.top, 4)
                        }
                        
                        Spacer()
                    }
                    .padding(.leading, 21)
                    
                    // Lists you saved section
                    VStack(alignment: .leading, spacing: 0) {
                        // Title/Medium
                        Text("Lists you saved")
                            .font(
                                Font.custom("Inter", size: 24)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.black)
                            .padding(.top, 24)
                            .padding(.leading, 21)
                        
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "cup.and.saucer.fill")
                                .font(.system(size: 20))
                                .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                .padding(.top, 16)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                // Title/Small
                                Text("Best Cafes to Study")
                                    .font(
                                        Font.custom("Inter", size: 18)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                    .padding(.top, 16)
                                
                                // Description/Small
                                Text("13 places")
                                    .font(Font.custom("Inter", size: 12))
                                    .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                    .padding(.top, 4)
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 21)
                        
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "person.2.fill")
                                .font(.system(size: 20))
                                .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                .padding(.top, 16)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                // Title/Small
                                Text("Top Family-friendly Spaces")
                                    .font(
                                        Font.custom("Inter", size: 18)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                    .padding(.top, 16)
                                
                                // Description/Small
                                Text("53 places")
                                    .font(Font.custom("Inter", size: 12))
                                    .foregroundColor(Color(red: 0.16, green: 0.17, blue: 0.18))
                                    .padding(.top, 4)
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 21)
                    }
                    
                    Spacer()
                }
                .background(Color.white)
            }
            
            AppFooter(selectedTab: $currentPage) {
                selectedCategory = nil
            }
            }
            .edgesIgnoringSafeArea(.bottom)
            }
            
            // Place detail popup overlay - only for list view
            if showPlacePopup, let place = selectedPlace, !isMapView {
                PlaceDetailPopup(place: place, isPresented: $showPlacePopup)
                    .zIndex(1000) // Ensure it's on top of everything
            }
            }
        }
        .onAppear {
            if shuffledMarkers.isEmpty {
                shuffledMarkers = sampleMarkers.shuffled()
            }
        }
    }
}
