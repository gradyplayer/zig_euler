const std = @import("std");

pub fn problem007() u64 {
    //What is the 10 001st prime number
    const seive_size = 10000000;
    var seive = [_]u8{0} ** seive_size;
    var nth_square: u32 = 0;
    var factor: u32 = 2;
    var cofactor: u32 = 1;
    var answer: u32 = 0;
    while (nth_square < 10001) {
        cofactor = 1;
        nth_square += 1;
        answer = factor;
        while (cofactor * factor < seive_size) {
            seive[cofactor * factor] = 1;
            cofactor += 1;
        }
        //find next prime:
        while (seive[factor] > 0) {
            factor += 1;
        }
    }

    return answer;
}

test " " {}
