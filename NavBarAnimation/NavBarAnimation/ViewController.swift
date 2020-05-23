import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var navBar: UIView!
    @IBOutlet var navBarHeight: NSLayoutConstraint!
    @IBOutlet var plusButton: UIButton!
    
    let oreoImage = UIImageView.init(image: UIImage.init(named: "oreos"))
    let pizzaImage = UIImageView.init(image: UIImage.init(named: "pizza_pockets"))
    let popTartsImage = UIImageView.init(image: UIImage.init(named: "pop_tarts"))
    let popSicleImage = UIImageView.init(image: UIImage.init(named: "popsicle"))
    let ramenImage = UIImageView.init(image: UIImage.init(named: "ramen"))
    
    var stack: UIStackView!
    
    var tableView: UITableView!
    
    var initialHeight:CGFloat = CGFloat.init()
    let endHeight:CGFloat = 200
    
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
        self.stack = UIStackView.init(arrangedSubviews: [oreoImage, pizzaImage, popTartsImage, popSicleImage, ramenImage])
        self.stack.translatesAutoresizingMaskIntoConstraints = false
        self.stack.axis = .horizontal
        self.stack.distribution = .fillEqually
        self.stack.spacing = 5
        self.stack.isHidden = true
        
        self.navBar.addSubview(stack)
        
        self.tableView = UITableView.init()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.tableView)
    }
    
    func setupLayout() -> Void {
        
        let heightImage = CGFloat.init(100)
                
        NSLayoutConstraint.activate([
            //navbar
            self.stack.bottomAnchor.constraint(equalTo: self.navBar.bottomAnchor, constant: -5),
            self.stack.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant: 5),
            self.stack.trailingAnchor.constraint(equalTo: self.plusButton.leadingAnchor, constant: -5),
            self.stack.heightAnchor.constraint(lessThanOrEqualTo: self.navBar.heightAnchor, multiplier: 0.8),
            self.oreoImage.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            self.pizzaImage.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            self.popTartsImage.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            self.popSicleImage.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            self.ramenImage.heightAnchor.constraint(lessThanOrEqualToConstant: heightImage),
            
            // tableView
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor,  constant: 5),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        state = (state == .opened) ? .closed : .opened
        self.navBarHeight.constant = self.isOpen ? CGFloat(endHeight) : CGFloat(initialHeight)
        UIView.animate(withDuration: 2,
                       delay: 0,
                       usingSpringWithDamping: 0.25, initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
                        self.view.layoutIfNeeded()
                        self.plusButton.transform = CGAffineTransform.init(rotationAngle: self.isOpen ? .pi/4 : 0)
                        self.stack.isHidden = !self.isOpen
        }
        )
        
    }
    
}

