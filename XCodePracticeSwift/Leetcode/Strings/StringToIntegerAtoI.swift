//
//  StringToIntegerAtoI.swift
//  XCodePracticeSwift
//
//  Created by Serhii Horinenko on 15.06.2024.
//


// 8. String to Integer (atoi)
// Level: Medium
// Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer.
// The algorithm for myAtoi(string s) is as follows:
// 1. Whitespace: Ignore any leading whitespace (" ").
// 2. Signedness: Determine the sign by checking if the next character is '-' or '+', assuming positivity is neither present.
// 3. Conversion: Read the integer by skipping leading zeros until a non-digit character is encountered or the end of the string is reached. If no digits were read, then the result is O.
// 4. Rounding: If the integer is out of the 32-bit signed integer range [-2^31, 2^31 - 1], then round the integer to remain in the range. Specifically, integers less than -2^31 should be rounded to -2^31, and integers greater than 2^31 - 1 should be rounded to 2^31 - 1.
//
// Return the integer as the final result.
//
// Example 1:
// Input: S = "42"
// Output: 42
// Explanation:
//    The underlined characters are what is read in and the caret is the current reader position.
//    Step 1: "42" (no characters read because there is no leading whitespace)
//             ^
//    Step 2: "42" (no characters read because there is neither a '-' nor '+')
//             ^
//    Step 3: "42" ("42" is read in)
//               ^
//
// Example 2:
// Input: s= " —042"
// Output: -42
// Explanation:
//    Step 1: " -042" (leading whitespace is read and ignored)
//              ^
//    Step 2: " -042" ('-' is read, so the result should be negative)
//               ^
//    Step 3: " -042" ("042" is read in, leading zeros ignored in the result)
//                 ^
//
// Example 3:
// Input: s = "1337c0d3"
// Output: 1337
// Explanation:
//    Step 1: "1337c0d3" (no characters read because there is no leading whitespace)
//             ^
//    Step 2: "1337c0d3" (no characters read because there is neither a '-' nor '+')
//             ^
//    Step 3: "1337c0d3" ("1337" is read in; reading stops because the next character is a non-digit)
//                 ^
//
// Example 4:
// Input: s = "0-1"
// Output: 0
// Explanation:
//    Step 1: "0-1" (no characters read because there is no leading whitespace)
//             ^
//    Step 2: "0-1" (no characters read because there is neither a '-' nor '+')
//             ^
//    Step 3: "0-1" ("0" is read in; reading stops because the next character is a non-digit)
//              ^
//
// Example 5:
// Input: s= "words and 987"
// Output: 0
// Explanation:
//    Reading stops at the first non-digit character 'w'.
//
// Constraints:
//    • 0 <= s.length <= 200
//    • s consists of English letters (lower-case and upper-case), digits (0-9), ' ', '+', '-', and '.'.

                                                                        
import Foundation

class StringToIntegerAtoI {
    
    static func test() {
        let instance = StringToIntegerAtoI()
        print("===< \(instance.self) >===-----------------------")
        print("s = '42': '\(instance.myAtoi("42"))'")
        print("s = ' —042': '\(instance.myAtoi(" -042"))'")
        print("s = '1337c0d3': '\(instance.myAtoi("1337c0d3"))'")
        print("s = '0-1': '\(instance.myAtoi("0-1"))'")
        print("s = 'words and 987': '\(instance.myAtoi("words and 987"))'")
        print("s = '-91283472332': '\(instance.myAtoi("-91283472332"))'")
        print("s = ' 0000000000012345678': '\(instance.myAtoi(" 0000000000012345678"))'")
        print("s = '21474836460': '\(instance.myAtoi("21474836460"))'")
        print("s = '+0 123': '\(instance.myAtoi("+0 123"))'")
        
        
    }
    
    func myAtoi(_ s: String) -> Int {
        var resultString: String = ""
        var sign: String = ""
        var s = String(s.trimmingPrefix { $0 == " " })
        for char in s {
            if "-+".contains(char), sign.isEmpty, resultString.isEmpty {
                sign = String(char)
            } else if "0123456789".contains(char) {
                resultString.append(char)
            } else {
                break
            }
        }
        resultString = String(resultString.trimmingPrefix { $0 == "0" })
        
        if sign == "-" {
            if resultString.count > 10 {
                return Int(Int32.min)
            } else {
                var resultInt: Int = -(Int(resultString) ?? 0)

                if resultInt <= Int(Int32.min) {
                    return Int(Int32.min)
                } else {
                    return resultInt
                }
            }
        } else {
            if resultString.count > 10 {
                return Int(Int32.max)
            } else {
                var resultInt: Int = Int(resultString) ?? 0

                if resultInt >= Int(Int32.max) {
                    return Int(Int32.max)
                } else {
                    return resultInt
                }
            }
        }
    }
    
}

