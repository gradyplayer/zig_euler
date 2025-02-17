const std = @import("std");
pub const problem = @import("project_euler_001.zig").problem001;

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)

    const start_time = std.time.milliTimestamp();
    const answer = problem();
    const end_time = std.time.milliTimestamp();

    std.debug.print("The Answer is: {}\n\t and it took ({d}) seconds", .{ answer, @as(f32, @floatFromInt(end_time - start_time)) / 1000.0 });
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
