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

    let mut s = 0;
    for i in 0..a.len() {
        if a[i] == 0 {
            println!("{}", s);
            s = 0;
        } else {
            s += 1;
        }
    }
}
