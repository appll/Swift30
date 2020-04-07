import UIKit

var str: String = "Hello, playground"

let tableView: UITableView = {
    let tbView = UITableView.init(frame: .zero, style: UITableView.Style.plain)
    return tbView
}()


class Person: NSObject {
    @objc var name: String
    var tags: [String] = []
    
    init(pName: String) {
        name = pName
    }
}

let person = Person(pName: "lol")

let name = person.value(forKey: #keyPath(Person.name))
#keyPath(Person.name)
let n1 = person.value(forKey: "name")
