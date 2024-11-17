fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();

    let dt = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse::<i32>().unwrap())
        .collect::<Vec<_>>();

    let a = dt[0];
    let b = dt[1];

    if a > b {
        println!("a > b");
    } else if a < b {
        println!("a < b");
    } else {
        println!("a == b");
    }
}
