use std::io::{self, BufRead};
fn main() {
    let stdin = io::stdin();
    let mut reader = stdin.lock().lines();

    for _ in 0..2 {
        if let Some(Ok(buf)) = reader.next() {
            println!("{}", buf.trim());
        }
    }
}
