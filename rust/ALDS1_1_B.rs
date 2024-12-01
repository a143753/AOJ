fn gcd(mut a: i32, mut b: i32) -> i32 {
    while b != 0 {
        let temp = b;
        b = a % b;
        a = temp;
    }
    a
}

fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let a: Vec<i32> = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse().unwrap())
        .collect();

    let ans = gcd(a[0], a[1]);

    println!("{}", ans);
}
