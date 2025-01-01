use std::collections::HashMap;
use std::io::Read;

fn f(s: &str) -> HashMap<char, i32> {
    let mut h = HashMap::new();

    "abcdefghijklmnopqrstuvwxyz".chars().for_each(|c| {
        h.insert(c, 0);
    });

    for c in s.chars() {
        if c.is_alphabetic() {
            let count = h.entry(c).or_insert(0);
            *count += 1;
        }
    }
    h
}

fn main() {
    let mut reader = std::io::stdin();
    let mut buf = String::new();

    reader.read_to_string(&mut buf).unwrap();

    let h = f(&buf.to_lowercase());

    let mut k = h.keys().cloned().collect::<Vec<_>>();
    k.sort();

    for key in k {
        println!("{} : {}", key, h[&key]);
    }
}
