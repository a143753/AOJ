use std::io::BufRead;

fn main() {
    std::io::stdin()
        .lock()
        .lines()
        .enumerate()
        .for_each(|(i, line)| {
            let n = line.unwrap().parse::<i32>().unwrap();
            if n == 0 {
                return;
            }
            println!("Case {}: {}", i + 1, n);
        });
}
