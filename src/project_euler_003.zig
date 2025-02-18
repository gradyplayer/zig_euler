const std = @import("std");
// 0.000945 seconds
fn isPrime(i: u64) bool {
    const float_i = @as(f64, @floatFromInt(i));
    const sqrt_of_big = @as(u64, @intFromFloat(std.math.sqrt(float_i)));
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

pub fn problem003() u64 {
    //largest prime factor of 600851475143
    const big = 600851475143;
    const sqrt_of_big = @as(u64, @intFromFloat(std.math.sqrt(big)));
    var i = sqrt_of_big;
    while (i > 0) {
        if (@mod(big, i) == 0 and isPrime(i)) {
            return @as(u64, i);
        }
        i -= 1;
    }
    return 0;
}
