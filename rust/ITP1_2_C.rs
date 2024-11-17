fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let mut dt = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse::<i32>().unwrap())
        .collect::<Vec<_>>();

    dt.sort();

    println!(
        "{}",
        dt.iter()
            .map(|x| x.to_string())
            .collect::<Vec<String>>()
            .join(" ")
    )
}
