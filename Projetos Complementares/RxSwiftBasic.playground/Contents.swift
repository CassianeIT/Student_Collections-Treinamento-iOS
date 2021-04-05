import UIKit

// Código sincrono
var array = [1, 2, 3]
for number in array {
  print(number)
  array = [4, 5, 6]
}
print(array)

// Código assincrono
var arrayy = [1, 2, 3]
var currentIndex = 0

func printNext() {
    print(array[currentIndex])
    print(arrayy)
    print(currentIndex)

  if currentIndex != arrayy.count - 1 {
    print(arrayy.count)
    print(currentIndex)
    currentIndex += 1
    print(arrayy)
    print(currentIndex)

  }
}

printNext()

var currentIndexx = 0

