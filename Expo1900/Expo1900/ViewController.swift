import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var entryItems:[EntryData] = []
    var expositionData: [ExpositionData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        do {
            entryItems = try decodeEntry(from: "items")
            expositionData = try decodeEntry(from: "exposition_universelle_1900")
        } catch {
            print()
        }
        print(expositionData)
        print(entryItems)
    }
    
    func decodeEntry<T: Codable> (from: String) throws -> [T] {
        var result: [T] = []
        guard let items = NSDataAsset.init(name: from) else {
            return result
        }
        let decoder = JSONDecoder()
        do {
            result = try decoder.decode([T].self, from: items.data)
        } catch {
            let component = try decoder.decode(T.self, from: items.data)
            result.append(component)
        }
        return result
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let entry = entryItems[indexPath.row]
        cell.textLabel?.text = entry.name
        cell.imageView?.image = UIImage(named: entry.image)
        return cell
    }
}
