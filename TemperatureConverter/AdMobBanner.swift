//
//  AdMobBanner.swift
//  TemperatureConverter
//
//  Created by Cesar Ibarra on 3/4/25.
//

import Foundation
import SwiftUI
import GoogleMobileAds

struct AdMobBanner: View {
    var body: some View {
        AdBannerView()    }
}

struct AdMobBanner_Previews: PreviewProvider {
    static var previews: some View {
        AdMobBanner()
    }
}

struct AdBannerView : UIViewRepresentable {
    static let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    func makeUIView(context: UIViewRepresentableContext<AdBannerView>) -> BannerView {

        let banner = BannerView(adSize: AdSizeBanner)

        banner.adUnitID = "ca-app-pub-9405221176366476/9073956267"

        //Test Banner
//        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"

        banner.rootViewController = UIApplication.shared.currentUIWindow()?.rootViewController
        banner.load(Request())
        return banner

    }

    func updateUIView(_ uiView: BannerView, context: Context) {

    }
}

public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
        
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }

        return window
        
    }
}
