const std = @import("std");

// A Pythagorean triplet is a set of three natural numbers, a < b < c, for which:
// a^2 + b^2 = c^2
//There exists exactly one Pythagorean triplet for which a^2 + b^2 = c^2.
//Find the product abc.
fn check_pythagorian(a: usize, b: usize, c: usize) bool {
    if (a * a + b * b == c * c) {
        return true;
    }
    return false;
}
//The Answer is: 31875000
//  and it took: 0.212543 seconds
pub fn problem009() u128 {
    for (1..1000) |a| {
        for (a + 1..1000) |b| {
            for (b + 1..1000) |c| {
                if (a + b + c == 1000) {
                    if (check_pythagorian(a, b, c)) {
                        return a * b * c;
                    } else if (a + b + c > 1000) {
                        break;
                    }
                }
            }
        }
    }
    return 0;
}

//The Answer is: 31875000
//  and it took: 0.026233 seconds
pub fn problem009a() u128 {
    var a: u16 = undefined;
    var b: u16 = undefined;
    var c: u16 = 998;
    while (c > 335) : (c -= 1) {
        b = c - 1;
        if (c + b > 999) {
            continue;
        }
        while (b > 1) : (b -= 1) {
            a = b - 1;
            while (a > 0) : (a -= 1) {
                if (a + b + c == 1000) {
                    if (check_pythagorian(a, b, c)) {
                        return @as(u64, a) * b * c;
                    } else if (a + b + c < 1000) {
                        break;
                    }
                }
            }
        }
    }
    return 0;
}

test " " {
    try std.testing.expectEqual(problem009(), problem009a());
}
