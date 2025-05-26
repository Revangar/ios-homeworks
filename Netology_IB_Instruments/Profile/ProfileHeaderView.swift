import UIKit

final class ProfileHeaderView: UIView {
    
    private let fullNameLabel = UILabel()
    private let statusLabel = UILabel()
    private let statusTextField = UITextField()
    private let statusButton = UIButton(type: .system)
    private let avatarImageView = UIImageView()

    private var statusText: String = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = .white

        fullNameLabel.text = "Илья Т."
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)

        statusLabel.text = "Пока нет статуса"
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .gray

        statusTextField.placeholder = "Введите новый статус"
        statusTextField.borderStyle = .roundedRect
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

        statusButton.setTitle("Обновить статус", for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.tintColor = .white
        statusButton.layer.cornerRadius = 8
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.layer.cornerRadius = 35
        avatarImageView.layer.masksToBounds = true
        avatarImageView.contentMode = .scaleAspectFill

        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(statusButton)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let padding: CGFloat = 16
        let avatarSize: CGFloat = 70

        avatarImageView.frame = CGRect(
            x: padding,
            y: padding + safeAreaInsets.top,
            width: avatarSize,
            height: avatarSize
        )

        fullNameLabel.frame = CGRect(
            x: avatarImageView.frame.maxX + padding,
            y: avatarImageView.frame.minY,
            width: bounds.width - avatarImageView.frame.maxX - 2 * padding,
            height: 24
        )

        statusLabel.frame = CGRect(
            x: fullNameLabel.frame.minX,
            y: fullNameLabel.frame.maxY + 4,
            width: fullNameLabel.frame.width,
            height: 20
        )

        statusTextField.frame = CGRect(
            x: padding,
            y: avatarImageView.frame.maxY + padding,
            width: bounds.width - 2 * padding,
            height: 40
        )

        statusButton.frame = CGRect(
            x: padding,
            y: statusTextField.frame.maxY + 12,
            width: bounds.width - 2 * padding,
            height: 44
        )
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

    @objc private func buttonPressed() {
        statusLabel.text = statusText
        print("Статус обновлён: \(statusText)")
    }
}
