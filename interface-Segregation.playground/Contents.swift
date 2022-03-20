import Foundation


// The idea of Liskov Substitution Principle:
// ###########################################
/// A client should not be forced to implement an interface that it doesn’t use
/// no need to add the functionality of code to the entities(Class, Struct, Enum) that doesn't make use of it

//MARK: - Bad Practice Example
// the issue here is that the protocol is generic and when you implement that protocol it will add or the functions and you may not need all that func
protocol AnimalProperties {
    func fly()
    func eat()
    func swim()
}
// fish can't fly so no need to add the fly func where it voliates the interface segregation princple
class fish:AnimalProperties{
    func fly() {
        print("fly")
    }
    
    func eat() {
        print("eat")

    }
    
    func swim() {
        print("swim")

    }

}
// lion can't swim so no need to add the swim func where it voliates the interface segregation princple

class lion:AnimalProperties{
    func fly() {
        print("fly")
    }
    
    func eat() {
        print("eat")

    }
    
    func swim() {
        print("swim")

    }
}
// pigeons can't swim so no need to add the swim func where it voliates the interface segregation princple
class pigeons:AnimalProperties{
    func fly() {
        print("fly")
    }
    
    func eat() {
        print("eat")

    }
    
    func swim() {
        print("swim")

    }
}

//MARK: - Good Practice Example
// here sperate each func in different interface and each entites need that func it can inherit and implement it
protocol Animals{
    func eat()
    func sleep()
}
protocol birds{
    func fly()
}
protocol fishes{
    func swim()
}


class fishA:Animals,fishes{
    func sleep(){
        print("sleep")
    }
    
    func eat() {
        print("eat")

    }
    
    func swim() {
        print("swim")

    }

}

class lionA:Animals{

    
    func eat() {
        print("eat")

    }
    func sleep(){
        print("sleep")
    }
}

class pigeonsA:Animals,birds{
    func fly() {
        print("fly")
    }
    
    func eat() {
        print("eat")

    }
    func sleep() {
        print("sleep")
    }

}
