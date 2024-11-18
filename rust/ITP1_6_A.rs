fn main() {
    let mut buf = String::new();

    std::io::stdin().read_line(&mut buf).unwrap();
    buf.clear();
    std::io::stdin().read_line(&mut buf).unwrap();
    let id = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse::<i32>().unwrap())
        .collect::<Vec<_>>();

    let od = id.iter().rev();

    println!(
        "{}",
        od.map(|x| x.to_string()).collect::<Vec<String>>().join(" ")
    );
}
