# FJSAlertControllerExtension
It helps you make better use of your UIAlertController

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Features

- It helps you make better use of your UIAlertController

## How to use
```swift
@IBAction func tap(_ sender: Any) {
    rx.present(title: "show text", message: "show the text selected button", preferredStyle: .alert,
               buttons: [.default("OK"), .cancel("CANCEL")], animated: true)
        .subscribe(onNext: { [unowned self] _, selectedButton in
            self.textLabel.text = selectedButton.title
        })
        .disposed(by: disposeBag)
}

@IBAction func changeBgColor(_ sender: UIBarButtonItem) {
    rx.present(title: "select color", message: "change background color", preferredStyle: .actionSheet,
               buttons: [.default("green"), .default("yellow"), .default("red"), .cancel("cancel")], animated: true)
        .subscribe(onNext: { [unowned self] index, selectedButton in
            switch index {
            case 0: self.view.backgroundColor = .green
            case 1: self.view.backgroundColor = .yellow
            case 2: self.view.backgroundColor = .red
            default: break
            }
        })
        .disposed(by: disposeBag)
}
```

## Runtime Requirements
- iOS8.0 or later
- Xcode 9.4.1 - Swift3.3 later

## Installation and Setup

### Installing with Carthage

Just add to your Cartfile:

```ogdl
github "fuji2013/FJSAlertControllerExtension"
```

## Contribution

Please file issues or submit pull requests for anything you’d like to see! We're waiting! :)

## License
AlertController+Extension.swift is released under the MIT license. Go read the LICENSE file for more information.
