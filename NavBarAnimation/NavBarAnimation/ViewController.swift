import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var navBar: UIView!
    @IBOutlet var navBarHeight: NSLayoutConstraint!
    @IBOutlet var plusButton: UIButton!
    
    let oreoButton = UIButton.init(type: .custom)
    let pizzaButton = UIButton.init(type: .custom)
    let popTartsButton = UIButton.init(type: .custom)
    let popSicleButton = UIButton.init(type: .custom)
    let ramenButton = UIButton.init(type: .custom)
    
    let titleNavBar = UILabel.init()
    var titleNavBarCenterYLayout: NSLayoutConstraint!
    
    var stack: UIStackView!
    
    var tableView: UITableView!
    
    var initialHeight:CGFloat = CGFloat.init()
    let endHeight:CGFloat = 200
    
    var snacks = [String]()
    
    var state: State = .closed
    //    {
    //        didSet (newValue) {
    //            switch newValue {
    //            case .opened:
    //                self.stack.isHidden = false
    //            case .closed:
    //                self.stack.isHidden = true
    //            }
    //        }
    //    }
    
    var isOpen: Bool { return state == .opened }
    
    enum State {
        case opened, closed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialHeight = navBarHeight.constant
        
        setupView()
        setupLayout()
    }
    
    func setupView() -> Void {
        self.oreoButton.setImage(UIImage.init(named: "oreos"), for: .normal)
        self.oreoButton.tag = 0
        self.pizzaButton.setImage(UIImage.init(named: "pizza_pockets"), for: .normal)
        self.pizzaButton.tag = 1
        self.popTartsButton.setImage(UIImage.init(named: "pop_tarts"), for: .normal)
        self.popTartsButton.tag = 2
        self.popSicleButton.setImage(UIImage.init(named: "popsicle"), for: .normal)
        self.popSicleButton.tag = 3
        self.ramenButton.setImage(UIImage.init(named: "ramen"), for: .normal)
        self.ramenButton.tag = 4
        
        self.oreoButton.addTarget(self, action: #selector(self.snackButtonTapped), for: .touchUpInside)
        self.pizzaButton.addTarget(self, action: #selector(self.snackButtonTapped), for: .touchUpInside)
        self.popTartsButton.addTarget(self, action: #selector(self.snackButtonTapped), for: .touchUpInside)
        self.popSicleButton.addTarget(self, action: #selector(self.snackButtonTapped), for: .touchUpInside)
        self.ramenButton.addTarget(self, action: #selector(self.snackButtonTapped), for: .touchUpInside)
        
        self.stack = UIStackView.init(arrangedSubviews: [oreoButton, pizzaButton, popTartsButton, popSicleButton, ramenButton])
        self.stack.translatesAutoresizingMaskIntoConstraints = false
        self.stack.axis = .horizontal
        self.stack.distribution = .fillEqually
        self.stack.spacing = 5
        self.stack.isHidden = true
        
        self.navBar.addSubview(stack)
        
        self.titleNavBar.translatesAutoresizingMaskIntoConstraints = false
        self.titleNavBar.text = "SNACKS"
        
        self.navBar.addSubview(self.titleNavBar)
        
        self.tableView = UITableView.init()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.view.addSubview(self.tableView)
    }
    
    func setupLayout() -> Void {
        
        let heightImage = CGFloat.init(100)
        titleNavBarCenterYLayout = self.titleNavBar.centerYAnchor.constraint(equalTo: navBar.centerYAnchor)
//        titleNavBarCenterYLayout.identifier = "titleNavBarCenterYLayout"
        
        NSLayoutConstraint.activate([
            //navbar
            self.stack.bottomAnchor.constraint(equalTo: self.navBar.bottomAnchor, constant: -5),
            self.stack.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant: 5),
            self.stack.trailingAnchor.constraint(equalTo: self.plusButton.leadingAnchor, constant: -5),
            self.stack.heightAnchor.constraint(lessThanOrEqualTo: self.navBar.heightAnchor, multiplier: 0.8),
            self.oreoButton.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            self.pizzaButton.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            self.popTartsButton.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            self.popSicleButton.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            self.ramenButton.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            self.titleNavBar.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            titleNavBarCenterYLayout,
            
            // tableView
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor,  constant: 5),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
    }
    
    @objc func snackButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            snacks.append("Oreo")
        case 1:
            snacks.append("Pizza Pocket")
        case 2:
            snacks.append("Pop Tarts")
        case 3:
            snacks.append("Popsicle")
        case 4:
            snacks.append("Ramen")
        default:
            break
        }
        tableView.insertRows(at: [IndexPath.init(row: snacks.count - 1, section: 0)], with: .automatic)
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        state = (state == .opened) ? .closed : .opened
        self.navBarHeight.constant = self.isOpen ? CGFloat(endHeight) : CGFloat(initialHeight)
        
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5, initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
                        self.view.layoutIfNeeded()
                        self.plusButton.transform = CGAffineTransform.init(rotationAngle: self.isOpen ? .pi/4 : 0)
                        self.stack.isHidden = !self.isOpen
                        self.titleNavBarCenterYLayout.constant = self.isOpen ? -40 : 0
                        self.titleNavBar.text = self.isOpen ? "ADD SNACK" : "SNACKS"
//                        self.titleNavBar.constraints.first { $0.identifier == "titleCenterYLayout" }?.constant = self.isOpen ? -40 : 0
        }
        )
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.snacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.snacks[indexPath.row]
        return cell
    }
    
}

