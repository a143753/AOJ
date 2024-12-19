use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut n = Vec::new();
    reader.lock().lines().take(1).for_each(|line| {
        n = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect();
    });

    let m: Vec<_> = n.iter().map(|n| n + 1).collect();

    m.iter().for_each(|m| {
        println!("{}", m);
    });
}
