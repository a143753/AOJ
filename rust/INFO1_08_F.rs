use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut n = 0;
    reader.lock().lines().take(1).for_each(|line| {
        n = line.unwrap().parse::<usize>().unwrap();
    });

    reader.lock().lines().take(n).for_each(|line| {
        let a = line.unwrap().parse::<usize>().unwrap();

        println!("{} {}", "#".repeat(a), a);
    });
}
