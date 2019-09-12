func square(math: Int) -> Int {
    let number = math * math
    return (number)
}

print(square(math: 5))

func five() -> Int {
    return 5
}
print(five())

func fullName(first: String, last: String) -> String {
    return first + " " + last
}
print(fullName(first: "Lance", last: "Davenport"))

func shout(input: String) -> String {
    return input + "!"
}
print(shout(input: "Money"))

func numberName(num: Int) -> String? {
//    let singleDigits = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    let letters = ["zero","One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
    if num <= 9 {
         return letters[num]
    }
    else {
        return nil
    }
}
print(numberName(num: 10))
