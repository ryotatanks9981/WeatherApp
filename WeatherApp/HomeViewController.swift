import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var prefectureTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prefectureTextField.placeholder = "県名を入力してください(ーー県 等の形式)"
        prefectureTextField.delegate = self
        
    }

    @IBAction func forecastedButton(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        guard let prefecture = prefectureTextField.text else { return }
        viewController.prefectureName = prefecture
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        prefectureTextField.resignFirstResponder()
    }
}
