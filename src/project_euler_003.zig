const std = @import("std");
// 0.000945 seconds
pub fn isPrime(i: u64) bool {
    const float_i = @as(f64, @floatFromInt(i));
    const sqrt_of_big = @as(u64, @intFromFloat(std.math.sqrt(float_i)));
    if (sqrt_of_big * sqrt_of_big == i) {
        return false; // perfect square case
    }
    var j: u64 = 2;
    while (j < sqrt_of_big + 1) {
        if (@mod(i, j) == 0) {
            return false;
        }
        j += 1;
    }
    return true;
}

// 0.003301 seconds ... fast enough that I don't want to invent a seive yet
pub fn problem003() u64 {
    //largest prime factor of 600851475143
    const big = 600851475143;
    const sqrt_of_big = @as(u64, @intFromFloat(std.math.sqrt(big))) + 1;
    var i = sqrt_of_big;
    while (i > 0) {
        if (@mod(big, i) == 0 and isPrime(i)) {
            return @as(u64, i);
        }
        i -= 1;
    }
    return 0;
}

test "is prime" {
    try std.testing.expectEqual(false, isPrime(20));
    try std.testing.expectEqual(false, isPrime(4));
    try std.testing.expectEqual(false, isPrime(6));
    try std.testing.expectEqual(false, isPrime(8));
    try std.testing.expectEqual(false, isPrime(9));
    try std.testing.expectEqual(false, isPrime(10));
    try std.testing.expectEqual(false, isPrime(12));
    try std.testing.expectEqual(false, isPrime(14));
    try std.testing.expectEqual(false, isPrime(15));
    try std.testing.expectEqual(false, isPrime(16));
    try std.testing.expectEqual(false, isPrime(28));
}
