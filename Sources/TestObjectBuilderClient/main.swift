import TestObjectBuilder

//let a = 17
//let b = 25
//
////let (result, code) = #TestObjectBuilder(a + b)
//
//print("The value \(result) was produced by the code \"\(code)\"")

@TestObjectBuilder
public struct MyType: Codable {
  let name: String = ""
  let age: Int = 1
  var surname: String?
}
