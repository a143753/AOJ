use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut n = 0;
    reader.lock().lines().take(1).for_each(|line| {
        n = line.unwrap().parse::<usize>().unwrap();
    });

    let mut a = Vec::new();
    let mut b = Vec::new();
    reader.lock().lines().take(2 * n).for_each(|line| {
        let v = line.unwrap().parse::<i32>().unwrap();

        if v < 0 {
            a.push(v);
        } else {
            b.push(v);
        }
    });

    (0..n).for_each(|i| {
        println!("{} {}", a[i], b[i]);
    });
}
