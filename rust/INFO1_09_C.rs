use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut a = Vec::new();
    reader.lock().lines().take(1).for_each(|line| {
        let n = line.unwrap().parse::<usize>().unwrap();
        a = vec![0; n];
    });

    let mut q = 0;
    reader.lock().lines().take(1).for_each(|line| {
        q = line.unwrap().parse::<usize>().unwrap();
    });

    reader.lock().lines().take(q).for_each(|line| {
        let c = line.unwrap().parse::<usize>().unwrap();
        a[c] += 1;
    });

    a.iter().for_each(|a| {
        println!("{}", a);
    });
}
