fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let dt = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse::<i32>().unwrap())
        .collect::<Vec<_>>();

    println!(
        "{} {} {}",
        dt[0] / dt[1],
        dt[0] % dt[1],
        dt[0] as f64 / dt[1] as f64
    )
}
