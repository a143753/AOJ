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

    let mut t = Vec::new();
    reader
        .lock()
        .lines()
        .take(2)
        .for_each(|line| t.push(line.unwrap().parse::<usize>().unwrap()));
    let l = t[0];
    let r = t[1];

    (l..r + 1).for_each(|i| {
        println!("{}", a[i]);
    });
}
