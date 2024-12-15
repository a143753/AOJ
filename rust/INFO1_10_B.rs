use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    reader.lock().lines().take(1).for_each(|line| {
        let s = line.unwrap();
        let a = s.bytes().nth(0).unwrap();
        println!("{}", a);
    });
}
