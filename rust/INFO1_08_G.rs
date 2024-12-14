use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut v = Vec::new();
    reader.lock().lines().take(2).for_each(|line| {
        v.push(line.unwrap().parse::<usize>().unwrap());
    });
    let n = v[0];
    let t = v[1];

    let mut a = Vec::new();
    reader.lock().lines().take(n).for_each(|line| {
        a.push(line.unwrap().parse::<usize>().unwrap());
    });

    let mut s = 0;
    for i in 0..a.len() {
        s += a[i];

        if s >= t {
            println!("{}", s);
            break;
        }
    }
}
