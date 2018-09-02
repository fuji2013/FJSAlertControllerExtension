# FJSAlertControllerExtension

# Additional Extensions

## convenience initializer. can add actions when initialize
init(title:, message:, preferredStyle:, actions:)

## return actionHandler with index of selected action and selected action
init(title:, message:, preferredStyle:, actions:, actionHandler:)

### Example
```swift
let greenAction = UIAlertAction(title: "green", style: .default)
let yellowAction = UIAlertAction(title: "yellow", style: .default)
let redAction = UIAlertAction(title: "red", style: .default)
let cancelAction = UIAlertAction(title: "cancel", style: .cancel)

let alertController = UIAlertController(title: "change background color", message: "select color", preferredStyle: .actionSheet, actions: [greenAction,yellowAction,redAction, cancelAction]) { (index, _) in
    
    switch index {
    case 0: self.view.backgroundColor = .green
    case 1: self.view.backgroundColor = .yellow
    case 2: self.view.backgroundColor = .red
    default: break
    }
}

present(alertController, animated: true)
```
