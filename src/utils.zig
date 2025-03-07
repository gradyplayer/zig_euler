const std = @import("std");

pub fn isPrime(i: u64) bool {
    if (i < 2) {
        return false;
    }
    const float_i = @as(f64, @floatFromInt(i));
    const sqrt_of_big = @as(u64, @intFromFloat(std.math.sqrt(float_i))) + 1;
    if (sqrt_of_big * sqrt_of_big == i) {
        return false; // perfect square case
    }
    var j: u64 = 2;
    while (j < sqrt_of_big) {
        if (@mod(i, j) == 0) {
            return false;
        }
        j += 1;
    }
    return true;
}

test "isprime" {
    try std.testing.expectEqual(false, isPrime(1));
    try std.testing.expectEqual(true, isPrime(2));
    try std.testing.expectEqual(true, isPrime(3));
    try std.testing.expectEqual(false, isPrime(4));
    try std.testing.expectEqual(true, isPrime(5));
    try std.testing.expectEqual(false, isPrime(6));
    try std.testing.expectEqual(true, isPrime(7));
    try std.testing.expectEqual(false, isPrime(8));
    try std.testing.expectEqual(false, isPrime(9));
    try std.testing.expectEqual(false, isPrime(10));
    try std.testing.expectEqual(true, isPrime(11));
}
