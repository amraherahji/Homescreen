import SwiftUI

struct ContentView: View {
    @State private var username = "Amrah"
    @State private var days = 3

    struct Itinerary: Identifiable {
            var id = UUID()
            var event: String
            var when: String
        }

    var plans = [
        Itinerary(event: "Taste Film", when: "10:00 AM"),
        Itinerary(event: "Arc de Triumph", when: "1:00 PM"),
        Itinerary(event: "Disneyland Paris", when: "3:00 PM"),
        Itinerary(event: "Louvre", when: "5:00 PM"),
        Itinerary(event: "Macaroon Shop", when: "7:00 PM")
    ]
    @State private var current = 67.0
    @State private var minValue = 0.0
    @State private var maxValue = 100.0

    var body: some View {
        VStack {
            Text("Hello,  \(username)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 52.0)
                .padding(.bottom, -1)
                

            VStack {
                HStack{
                    Text("✈️Upcoming  Flight in  ")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .frame(width: 200.0, height: 185.0)
                        .background(Color(red: 0.002, green: 0.597, blue: 0.857))
                        .cornerRadius(10)
                        .padding(.trailing, -22.5)
                        .padding(.horizontal, -180)
                        .foregroundStyle(.white)
                    Text(" T-\(days) days")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .frame(width: 175.0, height: 185.0)
                        .background(Color(red: 0.002, green: 0.597, blue: 0.857))
                        .cornerRadius(10)
                        .padding(.trailing, -175)
                        .foregroundStyle(.white)
                    
                }
                .padding(.bottom, 40)
                HStack {
                    VStack {
                        Text(" Book Hotel!")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.trailing, 10.0)
                            .frame(width: 200.0, height: 100.0)
                            .background(Color(red: 0.002, green: 0.597, blue: 0.857))
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                        
                        /* Text("Book Hotel!")
                            .font(.headline)
                            .padding(.trailing, 10.0)
                            .frame(width: 200.0, height: 100.0)
                            .background(Color.blue)
                            .cornerRadius(10)*/
                        Gauge(value: current, in: minValue...maxValue) {
                                } currentValueLabel: {
                                    Text("\(Int(current))")
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.white)
                                } minimumValueLabel: {
                                    Text("\(Int(minValue))")
                                        .foregroundColor(Color.white)
                                } maximumValueLabel: {
                                    Text("\(Int(maxValue))")
                                        .foregroundColor(Color.red)
                                }
                                .gaugeStyle(.accessoryCircularCapacity)
                                //.accentColor(Color.white)
                                .frame(width: 200, height: 110)
                                .background(Color(red: 0.002, green: 0.597, blue: 0.857))
                                .cornerRadius(10)
                        DatePicker("Label", selection: .constant(Date()), displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            
                        
                    }

                    .frame(width: 200.0, height: 100.0)
                    .padding(.top, 23)
                    VStack(alignment: .leading) {
                        Text("   Itinerary")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding()

                        ForEach(plans.indices, id: \.self) { index in
                            let event = plans[index]
                            VStack {
                                Text("Day \(index + 1)").font(.subheadline)
                                    .padding(.bottom, 8)
                                ForEach(plans.filter { $0.event == event.event }) { plan in
                                    HStack {
                                        Text(plan.event)
                                            .multilineTextAlignment(.leading)
                                            .font(.system(size: 15))
                                        Text(plan.when)
                                            .multilineTextAlignment(.trailing)
                                            .font(.system(size: 15))
                                    }
                                }
                                Text("---------------")
                            }
                            
                        }
                        .frame(height:82.0)
                    }
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .background(Color(red: 0.002, green: 0.597, blue: 0.857))
                    .cornerRadius(10)
                    //.padding(.bottom, 8)
                    .padding(.top, -45)
                    
                }
                .padding()

            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
