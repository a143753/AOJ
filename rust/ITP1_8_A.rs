fn f(s: &str) -> String {
    s.chars()
        .map(|c| {
            if c.is_uppercase() {
                c.to_lowercase().next().unwrap()
            } else if c.is_lowercase() {
                c.to_uppercase().next().unwrap()
            } else {
                c
            }
        })
        .collect()
}

fn main() {
    let reader = std::io::stdin();

    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    let line = buf.trim();

    let ans = f(line);

    println!("{}", ans);
}
