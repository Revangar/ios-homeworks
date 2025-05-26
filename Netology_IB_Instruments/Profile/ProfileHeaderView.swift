import UIKit

class ProfileHeaderView: UIView {

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Илья Трундаев"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Пока нет статуса"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите статус"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Установить статус", for: .normal)
        return button
    }()
    
    private var statusText: String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        [avatarImageView, nameLabel, statusLabel, statusTextField, setStatusButton].forEach {
            addSubview($0)
        }

        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let topInset = safeAreaInsets.top

        avatarImageView.frame = CGRect(x: 16, y: 16 + topInset, width: 80, height: 80)
        
        nameLabel.frame = CGRect(
            x: avatarImageView.frame.maxX + 16,
            y: avatarImageView.frame.minY + 14,
            width: bounds.width - avatarImageView.frame.maxX - 32,
            height: 20
        )
        
        statusLabel.frame = CGRect(
            x: avatarImageView.frame.maxX + 16,
            y: nameLabel.frame.maxY + 4,
            width: bounds.width - avatarImageView.frame.maxX - 32,
            height: 20
        )
        
        statusTextField.frame = CGRect(
            x: 16,
            y: avatarImageView.frame.maxY + 16,
            width: bounds.width - 32,
            height: 40
        )
        
        setStatusButton.frame = CGRect(
            x: 16,
            y: statusTextField.frame.maxY + 8,
            width: bounds.width - 32,
            height: 44
        )
    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText
        print("Статус: \(statusText)")
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
}
