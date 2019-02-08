import UIKit

class ViewController: UITableViewController {
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setup()
    }
    
    private func setup() {
        self.title = "TableView JSON"
    }
    
    private func loadData() {
        guard let url = Bundle.main.url(forResource: "jsonData", withExtension: "json") else {
            fatalError("Can't find json")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load json")
        }
        let decoder = JSONDecoder()
        guard let savedItems = try? decoder.decode([Item].self, from: data) else {
            fatalError("Failed to decode json")
        }
        
        items = savedItems
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let item = items[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.detail
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let detailViewController = DetailViewController(item: item)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
