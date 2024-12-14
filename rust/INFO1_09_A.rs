use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut n: usize = 0;
    reader.lock().lines().take(1).for_each(|line| {
        n = line.unwrap().parse::<usize>().unwrap();
    });

    let mut a = Vec::new();
    reader.lock().lines().take(n).for_each(|line| {
        a.push(line.unwrap().parse::<usize>().unwrap());
    });

    let mut k: usize = 0;
    reader.lock().lines().take(n).for_each(|line| {
        k = line.unwrap().parse::<usize>().unwrap();
    });

    println!("{}", a[k]);
}
