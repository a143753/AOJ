fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let dt = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse::<i32>().unwrap())
        .collect::<Vec<_>>();

    let (a, b, c) = (dt[0], dt[1], dt[2]);

    let mut count = 0;
    for i in a..b + 1 {
        if c % i == 0 {
            count += 1;
        }
    }
    println!("{}", count);
}
