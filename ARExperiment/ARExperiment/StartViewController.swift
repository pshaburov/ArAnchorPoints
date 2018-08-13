import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var oneModelUsingVectorsButton: UIButton!
    @IBOutlet weak var oneModelUsingAnchorsButton: UIButton!
    @IBOutlet weak var sizeComparisonButton: UIButton!
    @IBOutlet weak var recognizeObjectsButton: UIButton!
    @IBOutlet weak var lightsAnimationButton: UIButton!

    override func viewDidLoad() {
        setupButtonsTitles()
        setupButtonView()
    }

    private func setupButtonsTitles() {
       
        oneModelUsingAnchorsButton.setTitle(OneModelUsingAnchorsViewController.getName(), for: .normal)
        
    }

    private func setupButtonView() {
        oneModelUsingVectorsButton.backgroundColor = ButtonStyle.startButtonStyle.backgroundColor
        oneModelUsingVectorsButton.tintColor = ButtonStyle.startButtonStyle.textColor
        oneModelUsingVectorsButton.alpha = ButtonStyle.startButtonStyle.backgroundAlpha
        oneModelUsingVectorsButton.titleLabel?.adjustsFontSizeToFitWidth = true

        oneModelUsingAnchorsButton.backgroundColor = ButtonStyle.startButtonStyle.backgroundColor
        oneModelUsingAnchorsButton.tintColor = ButtonStyle.startButtonStyle.textColor
        oneModelUsingAnchorsButton.alpha = ButtonStyle.startButtonStyle.backgroundAlpha
        oneModelUsingAnchorsButton.titleLabel?.adjustsFontSizeToFitWidth = true

        sizeComparisonButton.backgroundColor = ButtonStyle.startButtonStyle.backgroundColor
        sizeComparisonButton.tintColor = ButtonStyle.startButtonStyle.textColor
        sizeComparisonButton.alpha = ButtonStyle.startButtonStyle.backgroundAlpha
        sizeComparisonButton.titleLabel?.adjustsFontSizeToFitWidth = true

        recognizeObjectsButton.backgroundColor = ButtonStyle.startButtonStyle.backgroundColor
        recognizeObjectsButton.tintColor = ButtonStyle.startButtonStyle.textColor
        recognizeObjectsButton.alpha = ButtonStyle.startButtonStyle.backgroundAlpha
        recognizeObjectsButton.titleLabel?.adjustsFontSizeToFitWidth = true

        lightsAnimationButton.backgroundColor = ButtonStyle.startButtonStyle.backgroundColor
        lightsAnimationButton.tintColor = ButtonStyle.startButtonStyle.textColor
        lightsAnimationButton.alpha = ButtonStyle.startButtonStyle.backgroundAlpha
        lightsAnimationButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }

}

private struct ButtonStyle {
    let backgroundColor: UIColor
    let textColor: UIColor
    let backgroundAlpha: CGFloat
}

private extension ButtonStyle {
    static var startButtonStyle = ButtonStyle(
        backgroundColor: .blue,
        textColor: .white,
        backgroundAlpha: 0.35)
}

private extension UIViewController {
    static func getName() -> String {
        return String(describing: self)
    }
}
