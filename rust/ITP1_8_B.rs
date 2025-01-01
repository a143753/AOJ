fn f(s: &str) -> u32 {
    s.chars().map(|c| c.to_digit(10).unwrap()).sum()
}

fn main() {
    let reader = std::io::stdin();
    let mut buf = String::new();

    while reader.read_line(&mut buf).unwrap() > 0 {
        let line = buf.trim();
        if line == "0" {
            break;
        }
        println!("{}", f(line));
        buf.clear();
    }
}
