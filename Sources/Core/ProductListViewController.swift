#if os(iOS)

import Config
import UIKit

/// Displays a list of products for the selected store.
/// Protocol defining the interface for displaying a list of products.
public class ProductListViewController: UIViewController, UITableViewDataSource {
    private let products: [Product]
    private let tableView = UITableView()

    public init(products: [Product]) {
        self.products = products
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        view.backgroundColor = .white

        tableView.frame = view.bounds
        tableView.dataSource = self
        view.addSubview(tableView)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = "Price - ₹\(product.price)"
        return cell
    }
}

#endif
