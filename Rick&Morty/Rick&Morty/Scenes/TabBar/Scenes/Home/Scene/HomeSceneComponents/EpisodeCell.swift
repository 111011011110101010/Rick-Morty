import UIKit
import SnapKit

class EpisodeCell: UICollectionViewCell {
    
    static let identifier = "EpisodeCell"
    private var heartTap: Bool = false
    
    
    private let baseView: UIView = {
        let baseView = UIView()
        baseView.layer.cornerRadius = 10
        baseView.backgroundColor = .blue
        baseView.layer.shadowColor = UIColor.black.cgColor
        baseView.layer.shadowOpacity = 0.5
        baseView.layer.shadowOffset = CGSize(width: 0, height: 0.2)
        baseView.layer.masksToBounds = false
        return baseView
    }()
    
    private let baseSubView: UIView = {
        let baseSubView = UIView()
        baseSubView.backgroundColor = .baseSubView
        baseSubView.layer.cornerRadius = 16
        return baseSubView
    }()
    
    private lazy var heartButton: UIButton = {
        let heartButton = UIButton(type: .custom)
        heartButton.setImage(UIImage(named: "customHeart"), for: .normal)
        heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        return heartButton
    }()

    @objc private func heartButtonTapped() {
        heartTap.toggle()
        let imageName = heartTap ? "heartFill" : "customHeart"
        heartButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    private let personImage: UIImageView = {
        let personImage = UIImageView()
        personImage.image = UIImage(named: "rick")
        personImage.contentMode = .scaleAspectFit
        personImage.clipsToBounds = true
        return personImage
    }()
    
    private let personNameLabel: UILabel = {
        let personNameLabel = UILabel()
        personNameLabel.text = "Rick Sanchez"
        personNameLabel.textAlignment = .left
        personNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        personNameLabel.backgroundColor = .clear
        return personNameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        configure()
        setupConstraints()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EpisodeCell {
    
    func configure() {
        self.contentView.addSubview(baseView)
        baseView.addSubview(personImage)
        baseView.addSubview(personNameLabel)
        baseView.addSubview(baseSubView)
        baseSubView.addSubview(heartButton)
    }
    
    func setupConstraints() {
        baseView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        personImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(232)
        }
        
        personNameLabel.snp.makeConstraints {
            $0.top.equalTo(personImage.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(54)
        }
        
        baseSubView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(71)
        }
        
        heartButton.snp.makeConstraints {
            $0.width.equalTo(41)
            $0.height.equalTo(40)
            $0.verticalEdges.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
    func setupAppearance() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
        layer.shadowRadius = 4
        layer.masksToBounds = false
        layer.cornerRadius = 10
        
        contentView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
}
