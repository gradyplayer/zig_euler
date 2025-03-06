const std = @import("std");
const isPrime = @import("project_euler_003.zig").isPrime;

pub fn problem006() u64 {
    //Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
    var sum_of_squares: u64 = 0;
    var square_of_sums: u64 = 0;
    for (1..101) |i| {
        sum_of_squares += i * i;
        square_of_sums += i;
    }

    return square_of_sums * square_of_sums - sum_of_squares;
}

test " " {}
