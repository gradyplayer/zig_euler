const std = @import("std");

pub fn problem002() i64 {
    var a: u32 = 1;
    var b: u32 = 1;
    var answer: i64 = 0;
    while (true) {
        const c: u32 = a + b;
        a = b;
        b = c;
        if (@mod(c, 2) == 0) {
            if (answer < 4000000) {
                answer += c;
            } else {
                return answer;
            }
        }
    }
    return 0;
}
