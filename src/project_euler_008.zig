const std = @import("std");

fn product_of_slice_unlimited(slc: []const u8) u128 {
    var answer: u128 = 1;
    for (slc) |i| {
        answer *= i - '0';
    }
    return answer;
}

fn product_of_slice(slc: []const u8, max_len: u8) u128 {
    var answer: u128 = 0;
    for (0..slc.len - max_len) |i| {
        const this_slice_len = @min(@as(usize, 13), @as(usize, slc.len - i));
        const slc2 = slc[i..this_slice_len];
        if (product_of_slice_unlimited(slc2) > answer) {
            answer = product_of_slice_unlimited(slc2);
        }
    }
    return answer;
}

pub fn problem008() u128 {
    const str_of_digits =
        "73167176531330624919225119674426574742355349194934" ++
        "96983520312774506326239578318016984801869478851843" ++
        "85861560789112949495459501737958331952853208805511" ++
        "12540698747158523863050715693290963295227443043557" ++
        "66896648950445244523161731856403098711121722383113" ++
        "62229893423380308135336276614282806444486645238749" ++
        "30358907296290491560440772390713810515859307960866" ++
        "70172427121883998797908792274921901699720888093776" ++
        "65727333001053367881220235421809751254540594752243" ++
        "52584907711670556013604839586446706324415722155397" ++
        "53697817977846174064955149290862569321978468622482" ++
        "83972241375657056057490261407972968652414535100474" ++
        "82166370484403199890008895243450658541227588666881" ++
        "16427171479924442928230863465674813919123162824586" ++
        "17866458359124566529476545682848912883142607690042" ++
        "24219022671055626321111109370544217506941658960408" ++
        "07198403850962455444362981230987879927244284909188" ++
        "84580156166097919133875499200524063689912560717606" ++
        "05886116467109405077541002256983155200055935729725" ++
        "71636269561882670428252483600823257530420752963450";
    // this will be super fast to cut through the whole thing by 13... but
    // since multiplying by 0 reduces the product to 0...
    // we could make slices, which I don't know how to do in zig...

    // first count the number of slices...
    //var ptr: usize = 0;
    var num_slices: u8 = 0;
    var skipping = false;
    for (0..str_of_digits.len) |i| {
        if (str_of_digits[i] == '0' and i < str_of_digits.len) {
            skipping = true;
        } else {
            if (skipping) {
                skipping = false;
                num_slices += 1;
            }
        }
    }
    std.debug.print("number of slices = {}\n", .{num_slices});
    const allocator = std.heap.page_allocator;
    const slice_array = allocator.alloc([]const u8, num_slices + 1) catch |err| {
        std.debug.print("alloc error {}", .{err});
        return 0;
    };

    defer allocator.free(slice_array);

    var start: usize = 0;
    var end: usize = 0;
    var slice_idx: usize = 0;
    var valid = false;
    for (0..str_of_digits.len) |i| {
        if (str_of_digits[i] == '0' and i < str_of_digits.len) {
            if (valid) {
                slice_array[slice_idx] = str_of_digits[start .. end + 1];
                slice_idx += 1;
            }
            valid = false;
        } else {
            if (valid == false) {
                start = i;
                valid = true;
            }
            end = i;
        }
    }
    var answer: u128 = 0;
    const max_len = 13;
    for (slice_array) |slc| {
        const slc_prod: u128 = product_of_slice(slc, max_len);
        if (slc_prod > answer) {
            answer = slc_prod;
        }
        for (slc) |i| {
            std.debug.print("{u} ", .{i});
        }
        std.debug.print("{s}", .{"\n"});
    }

    return answer;
}

test " " {}
