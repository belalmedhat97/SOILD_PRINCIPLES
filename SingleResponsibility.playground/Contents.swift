import Foundation


// The idea of Single Responsability Principle:
// ###########################################
/// Each Component (Class,Func...etc)  should have a single responsability and not to contain more than one Responsability



// codable for data parsing
struct APIData:Codable{
    var message:String?
    var status:String?
}

//MARK: - Bad Practice Example
// here the class define the network call and handle saving and retrieving data from user defaults with against Single Responsability rule
class NetworkRequestWithoutSingle{
// call api
    func apiCaller(){
        var request = URLRequest(url: URL(string: "https://dog.ceo/api/breeds/image/random")!)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(APIData.self, from: data!)
                print(responseModel.message ?? "")
                self.saveData(value:responseModel.message ?? "",key:"dog_url")
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
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

//MARK: - Good Practice Example
/// sperate the logic as each class has it's own responsability where network is for network calling and DataHandler for saving and retreiveing data
///
// network class
class NetworkRequestWithSingle{
// call api
    let dataManager = DataHandler()
    func apiCaller(){
        var request = URLRequest(url: URL(string: "https://dog.ceo/api/breeds/image/random")!)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(APIData.self, from: data!)
                print(responseModel.message ?? "")
                self.dataManager.saveData(value:responseModel.message ?? "",key:"dog_url")


            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }

}

// data saver and loader class
class DataHandler{
    
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

