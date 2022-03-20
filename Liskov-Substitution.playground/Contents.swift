import Foundation


// The idea of Liskov Substitution Principle:
// ###########################################
/// Child class should not break the parent class type definitions
/// A subclass should be able to override the parent class method in a way that it doesn’t break the functionality of the base class.The benefit of this principle is that when code is interchangeable, it becomes more reusable.
/// The principle defines that objects of a superclass shall be replaceable with objects of its subclasses without breaking the application. That requires the objects of your subclasses to behave in the same way as the objects of your superclass

//MARK: - Bad Practice Example
// here the class define the data saver
class DataManager {
    // data saver and loader class
    // save data
    func saveData(value:String,key:String){
        UserDefaults.standard.set(value, forKey: key)
    }
    // retrieve data
    func loadData(key:String) -> String{
        
        if let data = UserDefaults.standard.string(forKey: key) {
            return data
        }else{
            return ""
        }
    }
    
}
// issue here that when the DataMapper object changed the behaviour of the superclass it will voliate the LS principle
class DataMapper:DataManager{
    override func saveData(value:String,key:String){
        fatalError("The functionality will break the super class")
    }
}

let da = DataMapper()
da.saveData(value:"Hello",key:"welcome")


//MARK: - Good Practice Example
// here the class define the data saver
class DataManagerA {
    // data saver and loader class
    // save data
    func saveData(value:String,key:String){
        UserDefaults.standard.set(value, forKey: key)
    }
    // retrieve data
    func loadData(key:String) -> String{
        
        if let data = UserDefaults.standard.string(forKey: key) {
            return data
        }else{
            return ""
        }
    }
    
}
class DataMapperA:DataManagerA{
    override func saveData(value:String,key:String){
        print("Data saved")
        // do some func here that doesn't break the super class functionality
        super.saveData(value: value, key: key)
    }
}

let daA = DataMapperA()
daA.saveData(value:"Hello",key:"welcome")
