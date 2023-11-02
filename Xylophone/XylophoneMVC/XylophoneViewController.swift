//
//  XylophoneViewController.swift
//  Xylophone
//
//  Created by Liz-Mary on 31.10.2023.
//

import UIKit
import AVFoundation

class XylophoneViewController: UIViewController {
    
    let xylophoneView = XylophoneView()
    var audioPlayer: AVAudioPlayer?
    
    var isButtonTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        xylophoneView.delegate = self
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(xylophoneView.stackViewButton)
        
        NSLayoutConstraint.activate([
            xylophoneView.stackViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            xylophoneView.stackViewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            xylophoneView.stackViewButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            xylophoneView.stackViewButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
}

extension XylophoneViewController: XylophoneViewDelegate {
    
    /* Воспроизведение звука на основе названия кнопки
     
     do { ... } catch { ... } импользую для обработки ошибок.
    */
    
    func playSound(_ buttonText: String) {
        // Получаем URL звукового файла из папки "Sounds"
        if let soundURL = Bundle.main.url(forResource: buttonText, withExtension: "wav", subdirectory: "Sounds") {
            do {
                // Создаем и воспроизводим аудиоплеер
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Ошибка при воспроизведении звука: \(error.localizedDescription)")
            }
        } else {
            print("Звуковой файл не найден.")
        }
    }
    
    // Анимация изменения прозрачности кнопки
    func toggleButtonAlpha(_ button: UIButton) {
        if button.alpha == 1 {
            // если альфа равна одному анимируем до 0.5
            UIView.animate(withDuration: 0.2) {
                button.alpha = 0.5
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                button.alpha = 1
            }
        }
    }
    
    func buttonTapped(_ sender: UIButton) {
        let buttonText = sender.currentTitle ?? ""
        
        //вызов делегата для анимации и воспроизведения звука
        xylophoneView.delegate?.toggleButtonAlpha(sender)
        xylophoneView.delegate?.playSound(buttonText)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.xylophoneView.delegate?.toggleButtonAlpha(sender)
        }
    }
}
