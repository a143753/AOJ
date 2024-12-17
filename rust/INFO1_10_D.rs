use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    reader.lock().lines().take(1).for_each(|line| {
        let a = line.unwrap();
        let s = a.chars().nth(0).unwrap();
        if s.is_ascii_digit() {
            println!("digit");
        } else if s.is_ascii_uppercase() {
            println!("upper");
        } else if s.is_ascii_lowercase() {
            println!("lower");
        } else {
            println!("other");
        }
    });
}
