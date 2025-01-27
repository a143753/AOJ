use std::collections::HashMap;
use std::io::BufRead;

fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut col = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    }
    col
}

fn f(d: Vec<i32>) -> Vec<i32> {
    let mut h = HashMap::new();
    let mut r = Vec::new();

    for x in d {
        *h.entry(x).or_insert(0) += 1;
    }

    let m = h.values().max().unwrap();

    h.keys().for_each(|k| {
        if h[k] == *m {
            r.push(*k);
        }
    });
    r.sort();
    r
}

fn main() {
    let reader = std::io::stdin();
    let d = read_col_vec::<i32>(&mut reader.lock(), 0);

    let a = f(d);

    a.iter().for_each(|x| println!("{}", x));
}
