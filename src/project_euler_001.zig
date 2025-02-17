const std = @import("std");
// 0.000004 seconds
// 0.000004 seconds
pub fn problem001() i64 {
    var answer: u32 = 0;
    for (3..1000) |i| {
        if (@mod(i, 3) == 0 or @mod(i, 5) == 0) {
            answer += @intCast(i);
        }
    }
    return @as(i64, answer);
}

// 0.000002 seconds
// 0.000002 seconds
pub fn problem001a() i64 { //this doesn't need to be faster, but why not
    var answer: u32 = 0;
    const range_end = 1000;
    var needle: u32 = 0;
    const big_incr = 15;
    //first big fast loop
    while (true) {
        needle += big_incr;
        if (needle > range_end) {
            needle -= big_incr;
            break;
        }
        // each 15 is comprised of the following things we care about (n*15 - {0,3,5,6,9,10,12})
        answer += needle * 7 - (12 + 10 + 9 + 6 + 5 + 3);
    }
    if (false) {
        return answer;
    }
    // here we repeat the slow by one loop over the tail of the range, we already evaluated needle+0 in the previous big loop
    for (needle + 1..1000) |i| {
        if (@mod(i, 3) == 0 or @mod(i, 5) == 0) {
            answer += @intCast(i);
        }
    }
    return answer;
}

test "test equals" {
    try std.testing.expectEqual(problem001(), problem001a());
}
