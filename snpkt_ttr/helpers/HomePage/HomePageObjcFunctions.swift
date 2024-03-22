//
//  HomePageObjcFunctions.swift
//  snpkt_ttr
//
//  Created by Ö.Ş on 19.03.2024.
//

import UIKit

class HomePageObjcFunctions{
    
    static let instance = HomePageObjcFunctions()
    
    func TabBarTapped(tag: Int) -> String {
        var value = ""
        switch tag{
        case 0:
            value = "Bildirimler"
        case 1:
            value = "Cihaz"
        case 2:
            value = "Profil"
        default:
            break
        }
        return value
    }
    
    func MiddleViewButtonTapped(tag: Int) -> String{
        var value = ""
        switch tag{
        case 0:
            value = "Üretici Yazılımı Güncelleştirmesi"
        case 1:
            value = "Cihaz Paylaşımı"
        case 2:
            value = "Ses Kontrolü"
        case 3:
            value = "Yardım ve Geri Bildirim"
        case 4 :
            value = "Hakkımızda"
        case 5:
            value = "Ayarlar"
        default:
            break
        }
        return value
    }
    
    let contentss = [ ("notifications", "Bildirimler", 0), ("home", "Cihaz", 1),  ("person", "Profil", 2) ]
    
    let contents = [
        ("circleup", "orange", "Üretici Yazılımı Güncelleştirmesi"),
        ("share", "blue", "Cihaz Paylaşımı"),
        ("voice", "green", "Ses Kontrolü"),
        ("info", "purple", "Yardım ve Geri Bildirim"),
        ("our", "red", "Hakkımızda"),
        ("setting", "darkGreens", "Ayarlar")
    ]
}

