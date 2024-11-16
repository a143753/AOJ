fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let dat: Vec<i32> = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse::<i32>().unwrap())
        .collect();

    let a = dat[0];
    let b = dat[1];

    println!("{} {}", a * b, 2 * (a + b));
}
