use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    reader.lock().lines().take(1).for_each(|line| {
        let a = line.unwrap();
        println!("{}", a.len());
    });
}
