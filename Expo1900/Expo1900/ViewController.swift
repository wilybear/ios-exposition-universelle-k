import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var entryItems: [EntryData] = []
    var expositionData: ExpositionData?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        entryItems = decodeEntry(type: [EntryData].self, from: "items") ?? entryItems
        expositionData = decodeEntry(type: ExpositionData.self, from: "exposition_universelle_1900") ?? expositionData
    }
    
    func decodeEntry<T: Codable> (type: T.Type, from: String) -> T? {
        guard let items = NSDataAsset.init(name: from) else {
            return nil
        }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: items.data)
        } catch {
            print(error)
        }
        return nil
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
