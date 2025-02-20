const std = @import("std");

fn order(h: u64) u8 {
    var loop_ctr: u8 = 0;
    //0 = 0;
    //1..9=1;
    //10..99=2;
    var i = h;
    while (i > 0) {
        loop_ctr += 1;
        i = i / 10;
    }
    return loop_ctr;
}
fn isPalendrome(h: u64) bool {
    var i = h;
    const j = order(i);
    const allocator = std.heap.page_allocator;
    const forward_array = allocator.alloc(u8, j) catch |err| {
        std.debug.print("isPalendrome is an error {}", .{err});
        return false;
    };
    defer allocator.free(forward_array);
    var digit: u8 = 0;
    while (i > 0) {
        forward_array[digit] = @intCast(@mod(i, 10) + '0');
        digit += 1;
        i = i / 10;
    }
    var end = j - 1;
    while (end > i) {
        if (forward_array[i] != forward_array[end]) {
            return false;
        }
        i += 1;
        end -= 1;
    }
    return true;
}
//The Answer is: 906609
//  and it took: 2.635854 seconds
//vry slow
pub fn problem004() u64 {
    // A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91*99
    // Find the largest palindrome made from the product of two 3-digit numbers.
    var highest: u64 = 0;
    //do this the worst possible way;
    for (1..1000) |i| {
        for (1..1000) |j| {
            const test_n = i * j;
            if (isPalendrome(test_n) and test_n > highest) {
                highest = test_n;
            }
        }
    }

    return highest;
}

test "test order" {
    try std.testing.expectEqual(0, order(0));
    for (1..10) |i| {
        try std.testing.expectEqual(1, order(i));
    }
    for (10..100) |i| {
        try std.testing.expectEqual(2, order(i));
    }
    try std.testing.expectEqual(3, order(100));
    try std.testing.expectEqual(3, order(999));
    try std.testing.expectEqual(4, order(1000));
}

test "is palendrome" {
    try std.testing.expectEqual(false, isPalendrome(900099));
    try std.testing.expectEqual(true, isPalendrome(2332));
    try std.testing.expectEqual(true, isPalendrome(232));
    try std.testing.expectEqual(true, isPalendrome(222));
    try std.testing.expectEqual(false, isPalendrome(2232));
}
