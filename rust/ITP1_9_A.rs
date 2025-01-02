use std::io::Read;

fn f(v: Vec<&str>, w: &str) -> i32 {
    let mut n = 0;
    for x in v {
        if x.to_lowercase() == w {
            n += 1;
        }
    }
    n
}

fn main() {
    let mut reader = std::io::stdin();
    let mut buf = String::new();

    reader.read_line(&mut buf).unwrap();
    let b = buf.clone();
    let w = b.trim();

    buf.clear();
    reader.read_to_string(&mut buf).unwrap();
    let t: Vec<_> = buf
        .split_whitespace()
        .take_while(|x| *x != "END_OF_TEXT")
        .collect();
    println!("{:?}", f(t, w));
}
