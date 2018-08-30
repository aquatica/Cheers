import UIKit
import Cheers

class ViewController: UIViewController {

  let cheerView = CheerView()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white

    let strings = "💐🌷🌸🌹🌺🌻🌼"
        .map { s in NSAttributedString(string: String(s), attributes: [
            NSFontAttributeName: UIFont.systemFont(ofSize: 60)
            ]) }
    cheerView.config.particle = Particle.text(CGSize(width: 80, height: 80), strings)
//    cheerView.config.particle = .confetti(allowedShapes: Particle.ConfettiShape.all)
    view.addSubview(cheerView)
  }

  @IBAction func buttonTouched(_ sender: UIButton) {
    cheerView.start()

    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      self.cheerView.stop()
    }
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    cheerView.frame = view.bounds
  }
}

