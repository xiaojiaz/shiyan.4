//: Playground - noun: a place where people can play
//显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
import Foundation
import UIKit
let date = Date()
var dateform = DateFormatter()
dateform.locale = Locale.current
//dateform.locale = Locale(identifier: "中国")
dateform.dateFormat = "yyyy年M月dd日 E a HH:mm"
let t1 = dateform.string(from: date)
print(t1)
dateform.locale = Locale(identifier: "ja_JA")
let t2 = dateform.string(from: date)
print(t2)
dateform.locale = Locale(identifier: "us_UA")
let t3 = dateform.string(from: date)
print(t3)
dateform.locale = Locale(identifier: "fr_FR")
let t4 = dateform.string(from: date)
print(t4)
//处理字符串
let str = "Swift is a powerful and intuitive programming language for iOS,OS X,tvOS,and watchOS."
let index1 = str.index(str.startIndex, offsetBy: 5)
let index2 = str.index(str.startIndex, offsetBy: 20)
let str1 = str.substring(with: index1..<index2)
print(str1)
let str2 = str.replacingOccurrences(of: "OS", with: "")
print(str2)
//沙盒
let filemanager = FileManager.default
var url = filemanager.urls(for: .documentDirectory, in: .userDomainMask).first!
url.appendPathComponent("test4.txt")
//try?t1.write(to: url, atomically: true, encoding: .utf8)
//try?t2.write(to: url, atomically: true, encoding: .utf8)
//try?t3.write(to: url, atomically: false, encoding: .utf8)
//try?t4.write(to: url, atomically: false, encoding: .utf8)
//try? t1.write(toFile: url.path, atomically: true, encoding:.utf8)
//try? t2.write(toFile: url.lastPathComponent, atomically: true, encoding:.utf8)
//let tt = t1 as AnyObject
//tt.write(toFile: url.path, atomically: true)
let dic = ["北京:":t1,"东京:":t2,"纽约:":t3,"伦敦:":t4,"6-20":str1,"替换OS":str2] as AnyObject
dic.write(toFile: url.path, atomically: true)
//图片
let imgurl = URL(string: "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=546585246,4083642324&fm=27&gp=0.jpg")!
let fileManager1 = FileManager.default
var url1 = fileManager1.urls(for: .documentDirectory, in: .userDomainMask).first!
let imgdata = try? Data(contentsOf: imgurl)
url1.appendPathComponent("zz.jpg")
try? imgdata?.write(to: url1)
enum myerror:Error{
    case weaerror
}
guard let weaurl = URL(string:  "http://www.weather.com.cn/data/cityinfo/101010100.html")else{
    throw myerror.weaerror
}
let data = try! Data(contentsOf:weaurl)
let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
guard let weather = json as? [String:Any] else{
    throw myerror.weaerror
}
print(weather)
guard let string = weather["weatherinfo"] as? [String:String] else{
    throw myerror.weaerror
}
print(string)

