//
//  ViewController.swift
//  FirebaseTestProj
//
//  Created by Alisher Tulembekov on 02.05.2024.
//


import UIKit
import SnapKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    let database = Firestore.firestore()
    
    lazy var imageView1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "default_pic")
        image.contentMode = .scaleAspectFit // Изменено на scaleAspectFit
        image.clipsToBounds = true // Удерживает изображение в границах UIImageView
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var label1: UILabel = {
        let label = UILabel()
        label.text = "Класс мерса"
        return label
    }()
    var label2: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        return label
    }()
    var label3: UILabel = {
        let label = UILabel()
        label.text = "Choose your car!"
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        return label
    }()
    var button1: UIButton = {
        let button = UIButton()
        button.setTitle("C-class", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(CClassFunc), for: .touchUpInside)
        return button
    }()
    var button2: UIButton = {
        let button = UIButton()
        button.setTitle("E-class", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(EClassFunc), for: .touchUpInside)
        return button
    }()
    var button3: UIButton = {
        let button = UIButton()
        button.setTitle("S-class", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(SClassFunc), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
    }
    func setUI() {
        view.addSubview(imageView1)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        imageView1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(500)
            
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(imageView1.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
        }
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
        }
        label3.snp.makeConstraints { make in
            make.top.equalTo(label2).offset(40)
            make.centerX.equalToSuperview()
        }
        button1.snp.makeConstraints { make in
            make.top.equalTo(label3).offset(50)
            make.leading.equalToSuperview().inset(30)
        }
        button2.snp.makeConstraints { make in
            make.top.equalTo(label3).offset(50)
            make.centerX.equalToSuperview()
        }
        button3.snp.makeConstraints { make in
            make.top.equalTo(label3).offset(50)
            make.trailing.equalToSuperview().inset(30)
        }
    }
    @objc func CClassFunc() {
        FirebaseManager.shared.getPost(collection: "cars", docName: "smallCar", completion: { doc in
            guard doc != nil else { return }
            self.label1.text = doc?.field1
            self.label2.text = doc?.field2
        })
        FirebaseManager.shared.getImage(picName: "C-class", completion: { pic in
            self.imageView1.image = pic
        })
    }
    @objc func EClassFunc() {
        FirebaseManager.shared.getPost(collection: "cars", docName: "middleCar", completion: { doc in
            guard doc != nil else { return }
            self.label1.text = doc?.field1
            self.label2.text = doc?.field2
        })
        FirebaseManager.shared.getImage(picName: "E-class", completion: { pic in
            self.imageView1.image = pic
        })
    }
    @objc func SClassFunc() {
        FirebaseManager.shared.getPost(collection: "cars", docName: "bigCar", completion: { doc in
            guard doc != nil else { return }
            self.label1.text = doc?.field1
            self.label2.text = doc?.field2
        })
        FirebaseManager.shared.getImage(picName: "S-class", completion: { pic in
            self.imageView1.image = pic
        })
    }
    
    

}

