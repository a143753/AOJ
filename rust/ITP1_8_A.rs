fn f(s: &str) -> String {
    let mut r = String::new();

    (0..s.len()).for_each(|i| {
        let c = s.chars().nth(i).unwrap();
        if c.is_uppercase() {
            r.push_str(c.to_lowercase().collect::<String>().as_str());
        } else if c.is_lowercase() {
            r.push_str(c.to_uppercase().collect::<String>().as_str());
        } else {
            r.push(c);
        }
    });
    r
}

fn main() {
    let reader = std::io::stdin();

    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    let line = buf.trim();

    let ans = f(line);

    println!("{}", ans);
}
