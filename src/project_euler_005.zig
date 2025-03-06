const std = @import("std");
const isPrime = @import("project_euler_003.zig").isPrime;

pub fn problem005() u64 {
    // 2520  is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

    //What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
    //do this the worst possible way;
    // my first thought is we can cover the construction by mutiplying by all the numbers.., but we would have a lot of unneeded duplication,
    // so we could trim to  {20,19,18,17,16,15,14,13,12,11}; because every number less than 10 is at least covered by one of those above 10 by mulitplying by another smaller number
    // but that is actually still sub optimal, since we could cover 20 by including 4 and 5... we could cover 12 with 18 and 2...
    // so we could just multiply all the primes less than 20... those will all need to be factors...
    // then if there is a number not included from 1-20, multiply by that number a co-prime of one of the factors that is prime, the smaller side...

    var answer: u64 = 1;
    var j: u8 = 20;
    while (j > 2) {
        if (isPrime(j)) {
            if (@mod(answer, j) > 0) {
                answer *= j;
            }
        }
        j -= 1;
    }
    var not_divisible: u8 = 0;

    //do some manual intervention...
    answer /= 10;
    //verify
    for (2..21) |i| {
        if (@mod(answer, i) > 0) {
            not_divisible += 1;
            std.debug.print("The Answer{} is not divisible by {}, so far {} nondivisible\n", .{ answer, i, not_divisible });
            // this isn't logged, in fact every number is divisible a lot of times... like a lot...
        }
    }

    //;log out what we need to reduce
    for (2..21) |i| {
        std.debug.print("The Answer is overly divisible using {} by {} times\n", .{ i, answer / i });
    }

    //now we have a candidate answer that shouldn't be reducible, because each prime is only included once
    if (not_divisible == 0) {
        return answer;
    }

    return 0;
}

test " " {}
