import UIKit


protocol ThemeDelegate:AnyObject {
    func themeDidChange(to theme: String)
}


class SettingsVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var onOffLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var themeSegment: UISegmentedControl!
    
    weak var themeDelegate: ThemeDelegate?

    
    // UserDefaults keys
    let onOffKey = "onOffKey"
    let themeKey = "themeKey"
    let systemThemeKey = "systemTheme"
    let darkThemeKey = "darkTheme"
    let grayThemeKey = "grayTheme"
    
    // UserDefaults instance
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }
    
    
    
    
    // MARK: - UI Setup
    
    func setupUI() {
        configureSwitch()
        configureSegmentedControl()
        updateTheme()
    }
    
    func configureSwitch() {
        onOffSwitch.isOn = userDefaults.bool(forKey: onOffKey)
        onOffLabel.text = onOffSwitch.isOn ? "مفعل" : "غير مفعل"
        onOffSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
    }
    
    func configureSegmentedControl() {
        themeSegment.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }
    
    func updateTheme() {
        let theme = userDefaults.string(forKey: themeKey)
        
        switch theme {
        case systemThemeKey:
            themeSegment.selectedSegmentIndex = 0
            view.backgroundColor = .white
        case darkThemeKey:
            themeSegment.selectedSegmentIndex = 1
            view.backgroundColor = .black
        case grayThemeKey:
            themeSegment.selectedSegmentIndex = 2
            view.backgroundColor = .gray
        default:
            break
        }
    }
    
    // MARK: - Actions
    
    @objc func switchChanged(_ sender: UISwitch) {
        userDefaults.set(sender.isOn, forKey: onOffKey)
        onOffLabel.text = sender.isOn ? "مفعل" : "غير مفعل"
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            userDefaults.set(systemThemeKey, forKey: themeKey)
        case 1:
            userDefaults.set(darkThemeKey, forKey: themeKey)
        case 2:
            userDefaults.set(grayThemeKey, forKey: themeKey)
        default:
            userDefaults.set(systemThemeKey, forKey: themeKey)
        }
        updateTheme()
    }
}
