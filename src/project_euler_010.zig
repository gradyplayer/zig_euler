const std = @import("std");

//The Answer is: 142913828922
//  and it took: 0.029125 seconds
pub fn problem010() u64 {
    //Find the sum of all the primes below two million
    const max = 2_000_000;
    var sieve = [_]u8{0} ** (max + 1);
    var answer: u64 = 0;
    for (2..max) |i| {
        if (sieve[i] > 0) {
            continue; //not prime
        } else {
            // this is a prime
            answer += i;
        }
        var j: usize = i;
        while (j < max) {
            sieve[j] = 1;
            j += i;
        }
    }
    return answer;
}

test "test 10" {
    try std.testing.expectEqual(problem010(), 142913828922);
}
