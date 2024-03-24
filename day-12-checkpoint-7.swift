import Cocoa

class Animal {
    private(set) var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    func speak() {
        print("Woof woof bark bark bark")
    }
}

let chippy = Dog()
chippy.speak()

class Corgi:Dog {
    override func speak() {
        print("Arf Arf! ::pant pant pant::")
    }
}

let walter = Corgi()
walter.speak()

class Poodle: Dog {
    override func speak() {
        print("Barkbark bark barkbark grrr arf")
    }
}

let cornelius = Poodle()
cornelius.speak()

class Cat: Animal {
    var isTame: Bool
    
    init(isTame:Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("I love chicken, I love liver, meow mix meow mix please deliver")
    }
}

let lucy = Cat(isTame: true);
lucy.speak()

class Persian: Cat {
    init() {
        super.init(isTame: true)
    }
    
    override func speak() {
        print("Purrrrrrrrrrrr")
    }
}

let percy = Persian()
percy.speak()

class Lion: Cat {
    init() {
        super.init(isTame: false)
    }
    
    override func speak() {
        print("I just can't wait to be king")
    }
}

let simba = Lion()
simba.speak()
