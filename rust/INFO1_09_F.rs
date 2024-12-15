use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut n = 0;
    reader.lock().lines().take(1).for_each(|line| {
        n = line.unwrap().parse::<usize>().unwrap();
    });

    let mut a = Vec::new();
    reader.lock().lines().take(n).for_each(|line| {
        a.push(line.unwrap().parse::<i32>().unwrap());
    });

    a.sort();
    a.dedup();

    (0..a.len()).for_each(|i| {
        println!("{}", a[i]);
    });
}
