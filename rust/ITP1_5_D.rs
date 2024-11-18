fn ans(n: i32) {
    let mut i = 1;
    while i <= n {
        let mut x = i;
        if x % 3 == 0 {
            print!(" {}", i);
        } else {
            while x > 0 {
                if x % 10 == 3 {
                    print!(" {}", i);
                    break;
                }
                x /= 10;
            }
        }
        i += 1;
    }
    println!();
}

fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let dt = buf.trim().parse::<i32>().unwrap();

    ans(dt);
}
